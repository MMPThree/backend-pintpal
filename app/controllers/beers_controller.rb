class BeersController < ApplicationController
  def index 
    beers = Beer.all
    render json: beers
  end

  def show
    beer = Beer.find(params[:id])
    render json: beer
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :description, :image_url)
  end

end
