class WordsController < ApplicationController
  def index
    @catalog = Catalog.find(params[:catalog_id])
    @words = @catalog.words.all
    render json: @words
  end

  def create
    @catalog = Catalog.find(params[:catalog_id])
    @word = @catalog.words.create(word_params)
    render json: @word

  end

  def show
    @catalog = Catalog.find(params[:catalog_id])
    @word = @catalog.words.find(params[:id])
    render json: @word
  end

  def delete
    @catalog = Catalog.find(params[:catalog_id])
    @word = @catalog.words.find(params[:id])
    @word.destroy
  end

  private

  def word_params
    params.require(:word).permit(:word, :translate)
  end

end
