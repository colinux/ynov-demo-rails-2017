module RestaurantsHelper
  def restaurant_photo_url(restaurant)
    if restaurant.photo.present?
      restaurant.photo.path
    else
      "https://placehold.it/300x200?text=Photo+du+resto"
    end
  end

end
