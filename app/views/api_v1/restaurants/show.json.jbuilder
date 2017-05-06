json.extract! @restaurant, :id, :name, :city
json.comments @restaurant.comments do |comment|
  json.extract! comment, :id, :author, :text
end
