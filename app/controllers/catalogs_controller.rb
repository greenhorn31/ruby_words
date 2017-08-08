class CatalogsController < ApplicationController

  before_action :catalog, only: [:show, :update, :destroy]
  
  def index
    @catalogs = current_user.catalogs.all
    render json: @catalogs
  end

  def create
    @catalog = current_user.catalogs.new(catalog_params)
    if @catalog.save
      render json:  @catalog
    end
  end

  def show
    @catalog = current_user.catalogs.find(params[:id])
    render json: @catalog
  end

  def destroy
    @catalog = current_user.catalogs.find(params[:id])
    @catalog.destroy
  end


  private

  def catalog_params
    params.require(:catalog).permit(:name)
  end

  def catalog
    @catalog = current_user.catalogs.find(params[:catalog_id])
  end

end
