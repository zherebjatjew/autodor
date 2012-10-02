# encoding : UTF-8

class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html { @title = "Вход" }
      format.json {
#        render :status => 401,
#               :json => { :message => "Login required" }.to_json
        user = User.authentificate(params[:email], params[:password])
        if user.nil?
          render :status => 403, :json => { :message => "Invalid credentials" }.to_json
        else
          render :status => 200, :json => { :message => "You have logged in" }.to_json
        end
      }
    end
  end

  def create
    user = User.authentificate(
      params[:session][:email],
      params[:session][:password]
    )
    if user.nil?
      flash.now[:error] = "Неверный адрес или пароль"
      @title = "Вход"
      render 'new'
    else
      # Sign the user in and redirect to the user's show page
      sign_in user
      redirect_back_or user
    end
  end
  
  def destroy
    sign_out
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render :status => 200, :json => { :message => "You have logged out" }.to_json }
    end
  end
end
