# encoding : UTF-8

class DriversController < ApplicationController
  before_filter :authenticate

  def new
    @title = "Добавление водителя"
    @driver = Driver.new
    respond_to do |format|
      format.html { store_location }
      format.js
    end
  end

  def orders
    @title = "Заказы водителя"
    @driver = Driver.find params[:id]
    @user = current_user
    @orders = @driver.orders.paginate(:page => params[:page])
    respond_to do |format|
      format.html { render 'orders/index' }
      format.js { render 'orders/index' }
    end
  end

  def create
    @driver = Driver.new params[:driver]
    @driver.author = current_user
    respond_to do |format|
      format.html {
        if @driver.save
          flash[:success] = "Водитель #{@driver.name} добавлен в Автодор"
          redirect_back_or drivers_path
        else
          render :edit
        end
      }
      format.js {
        @driver.save
      }
    end
  end

  def index
    @title = "Водители"
    @drivers = Driver.paginate(:page => params[:page])
  end

  def update
    @title = "Изменение информации о водителе"
    @driver = Driver.find params[:id]
    if @client.update_attributes params[:client]
      flash[:success] = "Информация о клиенте обновлена"
      redirect_back_or clients_path
    else
      render :edit
    end
  end

  def edit
    @title = "Изменение информации о водителе"
    @driver = Driver.find params[:id]
  end

end
