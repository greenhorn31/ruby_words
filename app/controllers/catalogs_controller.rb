class CatalogsController < ApplicationController
  
  def index
    @catalogs = Catalog.all
    render json: @catalogs
  end

  def create
    @catalog = Catalog.new(catalog_params)
    if @catalog.save
      render json:  @catalog
    end
  end

  def show
    @catalog = Catalog.find(params[:id])
    render json: @catalog
  end

  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy
  end


  private

  def catalog_params
    params.require(:catalog).permit(:name)
  end

end
