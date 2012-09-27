# encoding : UTF-8

class CarsController < ApplicationController
  before_filter :authenticate

  def trucks
    @cars = Car.find_by_is_trailer(false)
    @car = Car.new params[:car]
    @car.author = current_user
    @car.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def trailers
    @cars = Car.find_by_is_trailer(true)
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

  def create
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
      format.js
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
end
