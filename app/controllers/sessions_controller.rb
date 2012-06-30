class SessionsController < ApplicationController
  def new
    @title = "Вход"
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
    redirect_to root_path
  end
end
