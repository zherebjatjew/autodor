# encoding : UTF-8

class ShippersController < ApplicationController
  before_filter :authenticate

  def create
    @shipper = Shipper.new params[:shipper]
    @shipper.author = current_user
    respond_to do |format|
      format.html {
        if @shipper.save
           # success
          flash[:success] = "Перевозчик #{@shipper.name} добавлен в Автодор"
          redirect_back_or shippers_path
        else
          render :edit
        end
      }
      format.js {
        unless @shipper.save
          render :json => @shipper.errors, :status => :unprocessable
        end
      }
    end
  end

  def update
    @shipper = Shipper.find params[:id]
    respond_to do |format|
      format.html {
        if @shipper.update_attributes params[:shipper]
          flash[:success] = "Информация о перевозчике обновлена"
          redirect_back_or shippers_path
        else
          render 'edit'
        end
      }
      format.js {
        unless @shipper.update_attributes(params[:shipper])
          render :json => @shipper.errors, :status => :unprocessable
        end
      }
    end
  end

  def edit
    @title = "Изменение информации о перевозчике"
    @shipper = Shipper.find params[:id]
    respond_to do |format|
      format.html
      format.js
    end
    @tab = "shipper"
  end

  def index
    @title = "Наши перевозчики"
    @shippers = Shipper.paginate(:page => params[:page])
    @tab = "shipper"
  end

  def show
    @title = "Договор с перевозчиком"
    @shipper = Shipper.find(params[:id])
    @owner = current_user.to_client
  end

  def new
    @title = "Добавление перевозчика"
    @shipper = Shipper.new
    @tab = "shipper"
    respond_to do |format|
      format.html
      format.js
    end
  end

  def orders
    @title = "Заявки"
    @shipper = Shipper.find params[:id]
    @orders = @shipper.orders.paginate(:page => params[:page])
    @user = current_user
    respond_to do |format|
      format.html { render 'orders/index' }
      format.js { render 'orders/index' }
    end
  end

end
