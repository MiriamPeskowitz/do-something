class User < ActiveRecord::Base
	has_many :things
	has_many :future_acts
	has_secure_password
	validates_presence_of :username, :email, :password
end 

# add has_many future_acts, through acts