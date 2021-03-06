# encoding : UTF-8

class UsersController < ApplicationController

  before_filter :authenticate
  before_filter :correct_user,     :only => :new_order
  before_filter :correct_or_admin, :only => [:edit, :update]
  before_filter :admin_user,       :only => [:destroy, :index, :new, :create, :enable, :disable]
  before_filter :not_me,           :only => [:enable, :disable]

  def index
    @title = "Все пользователи"
    @users = User.order('banned').paginate(:page => params[:page])
    @tab = "user"
  end

  def new
    @title = "Добавить"
    @user = User.new
    @tab = "user"
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удалён"
    redirect_to users_path
  end

  def show
    @user = User.find params[:id]
    if @user.admin?
      set = Order.order("created_at DESC")
    else
      set = Order.order("created_at DESC").where("forwarder_id = ? OR forwarder_id = NULL", @user.id)
    end
    @orders = set.order("created_at DESC").paginate :page => params[:page]
    @title = @user.name
    @tab = "me" if current_user == @user
  end

  def create
    @user = User.new params[:user]
    @user.author = current_user
    if @user.save
      # success
      flash[:success] = "Пользователь #{@user.name} добавлен в Автодор"
      redirect_to @user
    else
      @title = "Добавление пользователя"
      render :new
    end
  end

  def edit
    @title = "Редактирование профиля"
    @user = User.find params[:id]
    @tab = "user"
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      flash[:success] = "Профиль обновлён."
      redirect_to @user
    else
      @title = "Редактировать профиль"
      render 'edit'
    end
  end

  def enable
    @user = User.find params[:user]
    respond_to do |format|
      format.html {
        if @user.update_attribute(:banned, false)
          flash[:success] = "Пользователь разблокирован"
        else
          flash[:error] = "Невозможно разблокировать пользователя"
        end
        if request.xhr?
          render '_user', :layout => false
        else
          render 'index'
        end
      }
      format.json {
        @user.update_attribute(:banned, false)
        render '_user'
      }
    end
  end

  def disable
    @user = User.find params[:user]
    respond_to do |format|
      format.html {
        if @user.update_attribute(:banned, true)
          flash[:success] = "Пользователь заблокирован"
        else
          flash[:error] = "Невозможно заблокировать пользователя"
        end
        if request.xhr?
          render '_user', :layout => false
        else
          render 'index'
        end
      }
      format.json {
        @user.update_attribute(:banned, true)
        render '_user'
      }
    end
  end

  def new_order
    @order = @user.orders.create!
    redirect_to @order
  end

  private

    def correct_or_admin
      deny_access if current_user.nil? || (!current_user.admin? && current_user.id != params[:id])
    end

    def correct_user
      deny_access if current_user.nil? || current_user.id != params[:id]
    end

    def admin_user
      deny_access if current_user.nil? || !current_user.admin?
    end

    def not_me
      deny_access if current_user.id == params[:id]
    end
end
