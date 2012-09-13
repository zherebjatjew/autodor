# encoding : UTF-8

class ShippersController < ApplicationController

  def create
    @shipper= Shipper.new params[:shipper]
    @shipper.author = current_user
    if @shipper.save
      # success
      flash[:success] = "Перевозчик #{@shipper.name} добавлен в Автодор"
      redirect_back_or shippers_path
    else
      render :edit
    end
  end

  def update
    @shipper = Shipper.find params[:id]
    if @shipper.update_attributes params[:shipper]
      flash[:success] = "Информация о перевозчике обновлена"
      redirect_back_or clients_path
    else
      render 'edit'
    end
  end

  def edit
    @title = "Изменение информации о перевозчике"
    @shipper = Shipper.find params[:id]
  end

  def index
    @title = "Наши перевозчики"
    @shippers = Shipper.paginate(:page => params[:page])
  end

  def show
    @title = "Договор с перевозчиком"
    @shipper = Shipper.find(params[:id])
  end

  def new
    @title = "Добавление перевозчика"
    @shipper = Shipper.new
  end

end