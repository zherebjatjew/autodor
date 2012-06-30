class PagesController < ApplicationController
  def home
    @title = 'Домашняя страница'
  end

  def contact
    @title = 'Контакты'
  end

  def about
    @title = 'О программе'
  end

  def help
    @title = 'Справка'
  end
end
