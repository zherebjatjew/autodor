# encoding : UTF-8

class ClientsController < ApplicationController
	def index
    @clients = Client.all
  end

  def new
    @title = "Добавление клиента"
    @client = Client.new
  end

  def create
    @client = Client.new params[:client]
    if @client.save
      # success
      sign_in @client
      flash[:success] = "Клиент #{@client.name} добавлен в Автодор"
      redirect_to @client
    else
      render :edit
    end
  end

  def update
    @client = Client.find params[:id]
    if @client.update_attributes params[:client]
      flash[:success] = "Информация о клиенте обновлена"
      redirect_to @client
    else
      render 'edit'
    end
  end

  def edit
    @title = "Изменение информации о клиенте"
    @client = Client.find params[:id]
    if @client.update_attribues params[:client]
      flash[:success] = "Информация о клиенте обновлена"
      redirect_to @client
    else
      @title = ""
    end
  end
end
