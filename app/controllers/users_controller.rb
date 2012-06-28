class UsersController < ApplicationController

  before_filter :authenticate
  before_filter :correct_user,     :only => :new_order
  before_filter :correct_or_admin, :only => [:edit, :update]
  before_filter :admin_user,       :only => [:destroy, :index, :new, :create]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
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
      flash[:success] = "Welcome to Autodor!"
      redirect_to @user
    else
      @title = "Sign up"
      render :new
    end
  end

  def edit
    @title = "Edit user"
    @user = User.find params[:id]
  end

  def update
    if @user.update_attributes params[:user]
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
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
        deny_access unless current_user?(@user)
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
