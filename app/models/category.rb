class Category < ApplicationRecord
  has_many :beer_categories
  has_many :beers, through: :beer_categories
end
