class WordsController < ApplicationController

 ## before_action :catalog
#  before_action :word, only: [:show, :update, :destroy]


  def index
    @catalog = current_user.catalogs.find(params[:catalog_id])
    render json: @catalog.words
  end

  def create
    @catalog = current_user.catalogs.find(params[:catalog_id])
    @word = @catalog.words.create(word_params)
    render json: @word
  end

  def show
    @catalog = current_user.catalogs.find(params[:catalog_id])
    @word = @catalog.words.find(params[:id])
    render json: @word
  end

  def delete
    @catalog = current_user.catalogs.find(params[:catalog_id])
    @word = @catalog.words.find(params[:id])
    @word.destroy
  end

  private

  def word_params
    params.require(:word).permit(:word, :translate)
  end

##  def catalog
   # @catalog = current_user.catalogs.find(params[:catalog_id])
  #end

 # def word
  #  @word = @catalog.words.find_by(id: params[:id]) if @catalog
 # end

end
