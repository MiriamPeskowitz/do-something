class User < ActiveRecord::Base
	has_many :things
	has_many :futures
	has_secure_password
	validates_presence_of :username, :email, :password

	def capitalize(username)
		username.capitalize
	end 
	#can also modify in place (with exclamation mark/bang) :username => params[:usernname].capitalize!
end 
# add more specific validations, say, of password size? 
