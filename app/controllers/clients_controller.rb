# encoding : UTF-8

class ClientsController < ApplicationController
  before_filter :authenticate

  def new
    @title = "Добавление клиента"
    @client = Client.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @title = "Список клиентов"
    @clients = Client.paginate(:page => params[:page])
    @tab = "client"
    store_location
  end

  def show
    @client = Client.find(params[:id])
    @title = "Клиент #{@client.name}"
    respond_to do |format|
      format.html { render :conclusion }
    end
  end

  def create
    @client = Client.new params[:client]
    @client.author = current_user
    respond_to do |format|
      format.html {
        if @client.save
          # success
          flash[:success] = "Клиент #{@client.name} добавлен в Автодор"
          redirect_back_or clients_path
        else
          render :edit
        end
      }
      format.js {
        unless @client.save
          render :json => @client.errors, :status => 'unprocessable'
        end
      }
    end
  end

  def update
    @client = Client.find params[:id]
    respond_to do |format|
      format.html {
        if @client.update_attributes params[:client]
          flash[:success] = "Информация о клиенте обновлена"
          redirect_back_or clients_path
        else
          render 'edit'
        end
      }
      format.js {
        unless @client.update_attributes params[:client]
          render :json => @client.errors, :status => 'unprocessable'
        end
      }
    end
  end

  def edit
    @title = "Изменение информации о клиенте"
    @client = Client.find params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.delete()
    respond_to do |format|
      format.html { redirect_to 'index'}
      format.js { @client }
    end
  end
end
