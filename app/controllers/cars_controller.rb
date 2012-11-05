# encoding : UTF-8

class CarsController < ApplicationController
  before_filter :authenticate

  def trucks
    @cars = Car.trucks.paginate(:page => params[:page])
    @title = 'Автомобили'
    @tab = 'truck'
    respond_to do |format|
      format.html
      format.js
    end
  end

  def trailers
    @cars = Car.trailers.paginate(:page => params[:page])
    @title = 'Прицепы'
    @tab = 'trucks'
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new_truck
    @car = Car.new :is_trailer => false
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new_trailer
    @car = Car.new :is_trailer => true
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_truck
    @car = Car.new params[:car]
    @car.author = current_user
    respond_to do |format|
      format.html {
        if @car.save
          # success
          flash[:success] = "Транспорт #{@car.name} добавлен в Автодор"
        else
          render :edit
        end
      }
      format.js {
        @car.save
      }
    end
  end

  def update
    @car = Car.find params[:id]
    respond_to do |format|
      format.html {
        if @car.update_attributes params[:car]
          flash[:success] = "Информация о транспорте обновлена"
        else
          render 'edit'
        end
      }
      format.js {
        @car.update_attributes params[:car]
      }
    end
  end

  def edit
    @title = "Изменение информации о транспорте"
    @car = Car.find params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    Car.find(params[:id]).destroy
    flash[:success] = "Транспорт удалён"
    redirect_to trucks_path
  end
end
