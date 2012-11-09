# encoding : UTF-8

class OrdersController < ApplicationController
  before_filter :authenticate
  before_filter :current_or_admin, :only => [:index, :destroy, :edit, :update]

  def new
    @user = User.find params[:user]
    @order = @user.orders.new
    @order.forwarder = @user
    @order.status_id = 1
    @tab = "me"
  end

  def create
    @order = current_user.orders.new params[:order]
    @order.author = current_user
    @order.status_id = 1
    @order.user = current_user
    if @order.save
      flash[:success] = "Заявка создана!"
      redirect_to user_path(current_user)
    else
      render :edit
      @tab = "me"
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
    redirect_to user_path(current_user)
  end

  def show
    @order = Order.find_by_id params[:id]
    @cargos = @order.cargos
    @client = @order.client
    @owner = current_user.to_client
#    @senders, @receivers = @order.checkpoints
    @title = "Заявка №#{@order.id} - #{@order.info}"
    @tab = "me"
  end

  def charge
    @order = Order.find params[:id]
    @cargos = @order.cargos
    @client = current_user.to_client
#    @senders, @receivers = @order.checkpoints
    @title = "Поручение №#{params[:id]}"
    @tab = "me"
  end

  def index
    @title = "Все заявки"
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
    @tab = "me"
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
