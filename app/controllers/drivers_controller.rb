class DriversController < ApplicationController
  before_filter :authenticate

  def new
    @title = "Добавление водителя"
    @driver = Driver.new
    store_location
  end

  def create
    @driver = Driver.new params[:driver]
    if @driver.save
      flash[:success] = "Водитель #{@driver.name} добавлен в Автодор"
      redirect_back_or drivers_path
    else
      render :edit
    end
  end

  def update
    @title = "Изменение информации о водителе"
    @driver = Driver.find params[:id]
  end
end
