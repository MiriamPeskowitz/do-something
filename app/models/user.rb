class User < ActiveRecord::Base
  has_many :things
  has_many :futures

  has_secure_password
  
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true #,length: { minimum: 8, maximum: 20, wrong_length: "Please use between 8 and 20 characters."}

  def capitalize(username)
	username.capitalize
  end 
end 




# ?? validates_length_of :password, minimum: 6, if: Proc.new { |user| user.password.present? }