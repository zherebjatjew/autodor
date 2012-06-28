class OrdersController < ApplicationController
  before_filter :authenticate
  before_filter :current_or_admin, :only => [:index, :destroy]

  def new
    @user = User.find params[:user]
    @order = @user.orders.new
  end

  def create
    @order = current_user.orders.build params[:order]
    if @order.save
      flash[:success] = "Order created!"
      redirect_to user_path(current_user), :method => 'update'
    else
      render user_path current_user
    end
  end

  def destroy
    @order = Order.find_by_id params[:id]
    @order.destroy
    redirect_back_or root_path
  end

  def show
    @order = Order.find_by_id params[:id]
  end

  def index
    @title = "All orders"
    @users = Order.paginate(:page => params[:page])
  end

  private

    def current_or_admin
      deny_access unless (current_user.admin? || current_user.owns?(params[:id]))
    end
end
