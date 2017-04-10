class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true

  validates :photo, presence: true
  has_attachment :photo, accept: [:jpg, :png, :jpeg]
end
