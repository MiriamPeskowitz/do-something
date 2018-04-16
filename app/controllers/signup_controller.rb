class SignupController < ApplicationController

    get '/sign_up' do
  		if logged_in? 
  			redirect to '/things/' 
  		else
  			erb :'sign_up'
  		end 
  	end

  	post '/sign_up' do 
  		if params[:username] == '' ||  params[:email] ==  "" || params[:password] == ""
			redirect to '/signup/sign_up'
        else
  			@user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        	session[:user_id] = @user.id
  			redirect to '/things/'
  		end 
  	end 

  end