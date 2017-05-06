json.restaurants(@restaurants) do |restaurant|
  json.id restaurant.id
  json.name restaurant.name
  json.city restaurant.city

  json.comments(restaurant.comments) do |comment|
    json.id comment.id
    json.author comment.user.username
    json.text comment.text
  end
end
