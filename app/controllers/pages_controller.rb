# encoding : UTF-8

class PagesController < ApplicationController
  def home
    @title = 'Домашняя страница'
  end

  def contact
    @title = 'Контакты'
  end

  def about
    @title = 'О нас'
  end

  def help
    @title = 'Справка'
  end
end
