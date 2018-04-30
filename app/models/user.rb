class User < ActiveRecord::Base
  has_many :things
  has_many :futures
  has_secure_password
  validates_presence_of :email
  # validates_presence_of :password_digest
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 20, wrong_length: "Please use between 8 and 20 characters."}

  def capitalize(username)
	username.capitalize
  end 
	#note, can also modify in place (with exclamation mark/bang) :username => params[:usernname].capitalize!
end 


# # other possibilities for password validation: 
# validates_presence_of :password_digest

# validates_length_of :password, minimum: 6, if: Proc.new { |user| user.password.present? }