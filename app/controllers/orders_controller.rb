class OrdersController < ApplicationController
  before_filter :authenticate
  before_filter :allowed_to_delete, :only => :destroy

  def new
    @user = User.find params[:user]
    @order = @user.orders.new
  end

  def create
    @order = current_user.orders.build params[:order]
    if @order.save
      flash[:success] = "Order created!"
      redirect_to order_path, :method => 'update'
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

  private

    def allowed_to_delete
      if current_user.nil?
        false
      else
        if current_user.admin?
          true
        else
          current_user.owns? params[:id]
        end
      end
    end
end
