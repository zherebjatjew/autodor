class CargosController < ApplicationController
  before_filter :authenticate

  def index
  end

  def new
    @cargo = Cargo.new
  end

  def create
    @cargo = Cargo.new params[:cargo]
    @cargo.author = current_user
    if @cargo.save
      # success
      redirect_back_or cargos_path
    else
      render :edit
    end
  end

  def edit
    @cargo = Cargo.find params[:cargo]
  def update
  end
end
