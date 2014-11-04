class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	has_secure_password
	validates :password, length: { minimum: 6}
end
