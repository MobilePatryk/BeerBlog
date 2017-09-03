class User < ApplicationRecord
	has_many :comments, dependent: :destroy 
	validates :username, presence: true, 
	uniqueness: {case_sensitive:false},
	length: {minimum: 3, maximum: 25 }
	VALIDE_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length:{maximum: 105},
	uniqueness: {case_sensitive:false},
	format: {with: VALIDE_EMAIL_REGEX}
end
