# encoding : UTF-8

class OrdersController < ApplicationController
  before_filter :authenticate
  before_filter :current_or_admin, :only => [:index, :destroy, :edit, :update]

  def new
    @user = current_user
    @order = @user.orders.new
    @order.forwarder = @user
  end

  def create
    @order = current_user.orders.new params[:order]
    @order.author = current_user
    @order.user = current_user
    if @order.save
      flash[:success] = "Заявка создана!"
      redirect_to user_path(current_user), :method => 'show'
    else
      render :edit
    end
  end

  def change_status
    @order = Order.find params[:id]
    if @order.update_attributes :status_id => params[:status]
      respond_to do |format|
        format.html {
          if request.xhr?
            render :_status
          else
            render :_order
          end
        }
        format.js {
          render :_status
        }
      end
    end
  end

  def destroy
    @order = Order.find_by_id params[:id]
    @order.destroy
    redirect_to user_path(current_user), :method => 'show'
  end

  def show
    @order = Order.find_by_id params[:id]
    @cargos = @order.cargos
#    @senders, @receivers = @order.checkpoints
    @title = "Заказ №#{@order.id} - #{@order.info}"
  end

  def charge
    @order = Order.find params[:id]
    @cargos = @order.cargos
#    @senders, @receivers = @order.checkpoints
    @title = "Поручение №#{params[:id]}"
  end

  def index
    @title = "Все заказы"
    @user = current_user
    @orders = Order.paginate(:page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
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
      deny_access unless (current_user.admin? || current_user.owns?(Order.find params[:id]))
    end
end
