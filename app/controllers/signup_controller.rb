class SignupController < ApplicationController

    get '/sign_up' do
  		if logged_in? 
  			redirect to '/things/index' 
  		else
  			erb :'signup_form'
  		end 
  	end

  	post '/sign_up' do 
  		if params[:username] == '' ||  params[:email] ==  "" || params[:password] == ""
			redirect to '/signup/signup_form'
        else
  			@user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        	session[:user_id] = @user.id
  			redirect to '/things/index'
  		end 
  	end 

  end