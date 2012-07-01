# encoding : UTF-8

class UsersController < ApplicationController

  before_filter :authenticate
  before_filter :correct_user,     :only => :new_order
  before_filter :correct_or_admin, :only => [:edit, :update]
  before_filter :admin_user,       :only => [:destroy, :index, :new, :create]

  def index
    @title = "Все пользователи"
    @users = User.paginate(:page => params[:page])
  end

  def new
    @title = "Добавить"
    @user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удалён"
    redirect_to users_path
  end

  def show
    @user = User.find params[:id]
    @orders = @user.orders.paginate :page => params[:page]
    @title = @user.name
  end

  def create
    @user = User.new params[:user]
    if @user.save
      # success
      sign_in @user
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

  def new_order
    @order = @user.orders.create!
    redirect_to @order
  end

  private

    def correct_or_admin
      unless current_user.admin?
        @user = User.find params[:id]
        deny_access unless current_user == @user
      end
    end

    def correct_user
      @user = User.find params[:id]
      deny_access unless currect_user?(@user)
    end

    def admin_user
      deny_access unless current_user.admin?
    end
end
