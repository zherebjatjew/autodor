class CarsController < ApplicationController
  before_filter :authenticate

  def trucks
    @cars = Car.find_by_is_trailer(false)
    @car = Car.new params[:car]
    @car.author = current_user
    @car.save
    redirect_back_or :edit
  end

  def trailers
    @cars = Car.find_by_is_trailer(true)
  end

  def new_truck
    @car = Car.new :is_trailer => false
    store_location
  end

  def new_trailer
    @car = Car.new :is_trailer => true
  end

  def create
    @car = Car.new params[:car]
    @car.author = current_user
    if @car.save
      # success
      flash[:success] = "Транспорт #{@car.name} добавлен в Автодор"
      redirect_back_or cars_path
    else
      render :edit
    end
  end

  def update
    @car = Car.find params[:id]
    if @car.update_attributes params[:car]
      flash[:success] = "Информация о транспорте обновлена"
      redirect_back_or cars_path
    else
      render 'edit'
    end
  end

  def edit
    @title = "Изменение информации о транспорте"
    @car = Car.find params[:id]
  end
end
