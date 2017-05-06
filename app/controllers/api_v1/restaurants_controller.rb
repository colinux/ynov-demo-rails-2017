class ApiV1::RestaurantsController < ActionController::Base
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  rescue ActiveRecord::RecordNotFound => ex
    render json: { error: ex.message }, status: :not_found
  end
end
