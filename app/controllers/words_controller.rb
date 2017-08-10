class WordsController < ApplicationController

  before_action :catalog
  before_action :word, only: [:show, :update, :delete]


  def index
    render json: {:words => @catalog.words}.to_json
  end

  def create
    @word = @catalog.words.create(word_params)
    render json: @word.to_json
  end

  def update
    @word.update(word_params)
    render json: @word.to_json
  end

  def show
    render json: {:word => @word}.to_json
  end

  def delete
    @word.destroy
  end

  private

  def word_params
    params.require(:word).permit(:word, :translate)
  end

  def catalog
    @catalog = current_user.catalogs.find(params[:catalog_id])
  end

  def word
    @word = @catalog.words.find_by(id: params[:id]) if @catalog
  end

end
