class Users < ActiveRecord::Base
	has_many :acts
	has_secure_password
	validates_presence_of :username, :email, :password
end 

# add has_many future_acts, through acts