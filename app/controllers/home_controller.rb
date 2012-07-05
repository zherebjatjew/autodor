# encoding : UTF-8

class HomeController < ApplicationController
  def show
    unless current_user.nil?
      redirect_to current_user
    end
  end
end
