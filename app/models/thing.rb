class Thing < ActiveRecord::Base
	belongs_to :user

	  validates :date, presence: true	
	  validates :title, presence: true

end 