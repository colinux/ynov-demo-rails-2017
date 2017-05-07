class ApiV1::RestaurantsController < ActionController::Base
  # Oblige une identification par token sur tout le controller,
  # sauf pour l'index et show qui sont publiques
  acts_as_token_authentication_handler_for User, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  rescue ActiveRecord::RecordNotFound => ex
    render json: { error: ex.message }, status: :not_found
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.valid?
      @restaurant.save
      # renvoie show.json.jbuilder avec le code HTTP 204 Created
      render :show, status: :created
    else
      render_error
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :city)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
