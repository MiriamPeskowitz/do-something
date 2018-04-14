require_relative '../../config/environment'
require 'sinatra'

class Acts < ActiveRecord::Base
	belongs_to :user
end 