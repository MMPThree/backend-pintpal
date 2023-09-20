class BeersController < ApplicationController
  def index 
    beers = Beer.all
    render json: beers
  end

  def show
    beer = Beer.find(params[:id])
    render json: beer
  end

  def create 
    beer = Beer.create(params[:id])
    beer.update(beer_params)
    if beer.valid?
      render json: beer
    else
      render json: beer.errors, status: 422
    end
  end

  def update
    beer = Beer.find(params[:id])
    beer.update(beer_params)
    if beer.valid?
      render json: beer
    else
      render json: beer.errors, status: 422
    end
  end

  def destroy 
    beer = Beer.find(params[:id])
    if beer.destroy
      render json: beer
    else
      render json: beer.errors, status: 422
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :description, :image_url)
  end

end
