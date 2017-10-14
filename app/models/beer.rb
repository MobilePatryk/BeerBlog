class Beer < ApplicationRecord
	belongs_to :user
	has_many :beer_categories
	has_many :categories, through: :beer_categories
	validates :user_id, presence: true
end
