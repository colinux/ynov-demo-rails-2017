class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :text, length: { minimum: 5 }
end
