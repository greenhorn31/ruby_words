class CatalogsController < ApplicationController
  
  def index
   # current_user_init
    @user = User.find('5981d5479e93f91208070615')
    #@user = User.find(params[:id])
    @catalogs = @user.catalogs.all
    render json: @catalogs
  end

  def create
    @user = User.find(params[:id])
    @catalog = @user.catalogs.new(catalog_params)
    if @catalog.save
      render json:  @catalog
    end
  end

  def show
    @user = User.find(params[:id])
    @catalog = @user.catalogs.find(params[:id])
    render json: @catalog
  end

  def destroy
    @user = User.find(params[:id])
    @catalog = @user.catalogs.find(params[:id])
    @catalog.destroy
  end


  private

  def catalog_params
    params.require(:catalog).permit(:name)
  end

end
