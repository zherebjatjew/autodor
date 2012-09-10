class CargosController < ApplicationController
  before_filter :authenticate

  def index
  end

  def new
    @cargo = Cargo.new
  end

  def update
  end
end
