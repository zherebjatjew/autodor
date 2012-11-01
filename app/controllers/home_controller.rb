# encoding : UTF-8

class HomeController < ApplicationController
  before_filter :admin_user,       :only => [:edit, :update]

  def show
    @tab = 'home'
    @title = 'Автодор'
    @company = Company.instance
  end

  def edit
    @tab = 'home'
    @title = 'Атрибуты компании'
    @company = Company.instance
  end

  def update
    @company = Company.instance
    if @company.update_attributes(params[:company])
      redirect_to root_path
    else
      render :edit
    end
  end

private

  def admin_user
    deny_access if current_user.nil? || !current_user.admin?
  end
end
