# encoding : UTF-8

module SessionsHelper

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    unless signed_in?
      respond_to do |format|
        format.html {
          store_location
          redirect_to signin_path, :notice => "Вы должны зарегистрироваться, чтобы получить доступ к этой странице"
        }
        format.json {
          render :status => 401,
                 :json => { :message => "You have to be authorized to access this data" }.to_json
        }
      end
    else
      respond_to do |format|
        format.html {
          redirect_to user_path(current_user), :notice => "Недостаточно прав для доступа к странице"
        }
        format.json {
          render :status => 403,
                 :json => { :message => "Not enough privileges to access this data" }.to_json
        }
      end
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
    clear_location
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_location
    session[:return_to] = nil
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

end
