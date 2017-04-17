Restaurant.destroy_all
User.destroy_all

def open_photo(name)
  File.open(Rails.root.join("db", "restaurant-images", name))
end

user = User.create!(email: "colin@darie.eu", username: "colinux", password: "password")

resto = Restaurant.create!(name: "Aux Petits Oignons", user: user,
  city: "Aix-en-Provence", photo: open_photo("aux-petits-oignons.jpg"))

resto = Restaurant.create!(name: "Via Italia", user: user,
  city: "Aix-en-Provence", photo: open_photo("via-italia.jpg"))

resto = Restaurant.create!(name: "Rowing Club", user: user,
  city: "Marseille", photo: open_photo("rowing-club.jpg"))
