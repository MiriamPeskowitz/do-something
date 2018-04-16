class SignupController < ApplicationController

    get '/signup/signup_form' do
  		if logged_in? 
  			redirect to '/things/index' 
  		else
  			erb :'signup/signup_form'
  		end 
  	end

  	post '/signup/signup_form' do 
  		if params[:username] == '' ||  params[:email] ==  "" || params[:password] == ""
			  redirect to '/signup/signup_form'
      # add flash notice
      else
  			@user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        session[:user_id] = @user.id
  			redirect to '/things'
  		end 
  	end 

  end