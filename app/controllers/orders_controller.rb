# encoding : UTF-8

class OrdersController < ApplicationController
  before_filter :authenticate
  before_filter :current_or_admin, :only => [:index, :destroy]

  def new
    @user = User.find params[:user]
    @order = @user.orders.new
    @order.forwarder = @user
  end

  def create
    @order = current_user.orders.new params[:order]
    @order.author = current_user
    if @order.save
      flash[:success] = "Заявка создана!"
      redirect_to user_path(current_user), :method => 'show'
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find_by_id params[:id]
    @order.destroy
    redirect_to user_path(current_user), :method => 'show'
  end

  def show
    @order = Order.find_by_id params[:id]
    @title = "Заказ #{@order.id} - #{@order.info}"
  end

  def index
    @title = "Все заказы"
    @users = Order.paginate(:page => params[:page])
  end

  def edit
    @order = Order.find params[:id]
    @cargos = @order.cargos
    @title = "Редактирование заявки"
    store_location
  end

  def update
    clear_location
    @order = Order.find params[:id]
    if @order.update_attributes params[:order]
      @order.cargos.build
      flash[:success] = "Заявка обновлена"
      redirect_to @order.user
    else
      @title = "Редактирование заявки"
      render 'edit'
    end
  end

  def cargo_fields
    @cargo = Cargo.find params[:id]
    render "cargos/cargo_fields"
  end

  private

    def current_or_admin
      deny_access unless (current_user.admin? || current_user.owns?(params[:id]))
    end
end
