class User < ActiveRecord::Base
	has_many :things
	has_many :futures
	has_secure_password
	validates_presence_of :username, :email, :password
end 
# add more specific validations, say, of password size? 
