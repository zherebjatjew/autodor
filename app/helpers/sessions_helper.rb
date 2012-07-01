# encoding : UTF-8

module SessionsHelper

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    if signed_in?
      store_location
      redirect_to signin_path, :notice => "Вы должны зарегистрироваться, чтобы получить доступ к этой странице"
    else
      redirect_to user_path(current_user), :notice => "Недостаточно прав для доступа с странице"
    end
  end

  def sign_in user
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def sign_out
    cookies.delete :remember_token
    self.current_user = nil
  end

  def redirect_back_or default
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def current_user= user
    @current_user = user
  end

  def currect_user? user
    user == current_user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def admin?
    current_user && current_user.admin
  end

  private
    def user_from_remember_token
      User.authentificate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end
