class SignupController < ApplicationController

get '/users/signup' do
    
  		if logged_in? 
  			redirect to '/actions' 
  		else
  			erb :'users/signup'
  		end 
  	end