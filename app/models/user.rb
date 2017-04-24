class User < ActiveRecord::Base
	validates :username, presence: true,
						 uniqueness: {case_sensitivity: false}, 
						 length: {minimum: 3, maximum: 25}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true,
					  length: {maximum: 105},
					  uniqueness: {case_sensitivity: false},
					  format: {with: VALID_EMAIL_REGEX}
end