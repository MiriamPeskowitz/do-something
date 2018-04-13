class UsersController < ApplicationController
    # use Rack::Flash
# Change everything to users -- 
  	get '/users/signup' do
    
  		if logged_in? 
  			redirect to '/actions' 
  		else
  			erb :'citizens/signup'
  		end 
  	end

  	post '/citizens/signup' do 
  		if params[:username] == '' ||  params[:email] ==  "" || params[:password] == ""
  			
        redirect to '/citizens/signup'
  		else
  			@citizen = Citizen.create(:username => params[:username], :email => params[:email], :password => params[:password])
        session[:user_id] = @citizen.id
  			redirect to '/actions'
  		end 
  	end 

  	get '/citizens/login' do
    
  		if !logged_in?
  			 erb :'citizens/login'
  		else
  			 redirect to '/actions'
  		end 
  	end 	


   	post '/citizens/login' do
      redirect to '/actions' if logged_in?
      @citizen = Citizen.find_by(username: params[:username])
      
  	 	if @citizen && @citizen.authenticate(params[:password])
  	 		 session[:user_id] = @citizen.id
  		   redirect to '/actions'
  	  else
          # flash[:notice] = "You've got a lot on your mind, but we do need a valid Username and Password."
  	 	    redirect to '/'
  	  end
   	end 

    get '/citizens/index' do
        @actions = Action.all
        erb :'citizens/index'
    end 

  
  	get '/citizens/logout' do
  		if logged_in?
  			session.clear
  			erb :'citizens/logout'
  		else 
  			redirect to '/citizens/login'
  		end 
  	end 

  end
