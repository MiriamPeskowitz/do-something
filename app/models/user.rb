class User < ActiveRecord::Base
	has_many :things
	has_many :futures
	has_secure_password
	validates_presence_of :username, :email, :password {:length => (:minimum => 8)}
	# validates password, :presence => true, :length => (:minimum => 8)

	def capitalize(username)
		username.capitalize
	end 
	#can also modify in place (with exclamation mark/bang) :username => params[:usernname].capitalize!
end 
# add more specific validations, say, of password size? 


# # other possibilities for password validation: 
# validates_presence_of :password_digest

# validates_length_of :password, minimum: 6, if: Proc.new { |user| user.password.present? }