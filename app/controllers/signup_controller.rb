class SignupController < ApplicationController

get '/signup' do
    
  		if logged_in? 
  			redirect to '/acts' 
  		else
  			erb :'signup'
  		end 
  	end

  	post '/signup' do 
  		if params[:username] == '' ||  params[:email] ==  "" || params[:password] == ""
			redirect to '/users/signup'
        else
  			@user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        	session[:user_id] = @user.id
  			redirect to '/acts'?????
  		end 
  	end 

  end