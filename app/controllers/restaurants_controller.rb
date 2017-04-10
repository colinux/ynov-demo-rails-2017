class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.valid?
      @restaurant.save!
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :photo, :city)
  end
end
