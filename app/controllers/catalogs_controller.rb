class CatalogsController < ApplicationController

  before_action :catalog, only: [:show, :update, :destroy]

  def index
    @catalogs = current_user.catalogs
    @jcatalogs = @catalogs.map do |u|
      {:id => " #{u.id}", :name => u.name}
    end
    @jcatalogs = {:catalogs => @jcatalogs }.to_json

    render json: @jcatalogs
  end

  def create
    @catalog = current_user.catalogs.new(catalog_params)
    if @catalog.save

      render json:  @catalog
    end
  end

  def show
    @jcatalog = {:catalog => {:id => " #{@catalog.id}", :name => @catalog.name }}

    render json: @jcatalog.to_json
  end

  def catalog_words
    @catalog = current_user.catalogs.find(params[:id])
    @jcatalog = {:catalog => {:id => " #{@catalog.id}", :name => @catalog.name ,:words => @catalog.words}}

    render json: @jcatalog
  end

  def catalogs_words
    @catalogs = current_user.catalogs
    @jcatalogs = @catalogs.map do |u|
      {:id => " #{u.id}", :name => u.name, :words => u.words}
    end

    render json: {:catalogs => @jcatalogs}.to_json
  end

  def destroy
    @catalog.destroy
  end


  private

  def catalog_params
    params.require(:catalog).permit(:name)
  end

  def catalog
    @catalog = current_user.catalogs.find(params[:id])
  end

end
