class UsersController < ApplicationController
  helpers Sinatra::RedirectWithFlash  

  get '/users/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/things'
    end
  end

  post '/users/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      session[:notice] = "please sign up"
      #can I use session here if it hasn't been created yet? 
      redirect to '/users/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/things'
    end
  end
# signup and login get you to the same place. Signup and you don't have to login, 
# because @user is created. 

  get '/users/login' do 
    if !logged_in?
      erb :'users/login' 
    else
      redirect to "/things"
    end
  end

 post '/users/login' do
    user = User.find_by(:username => params[:username])
    #understand diff of User.find(... )
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/things"
    else
      redirect to '/users/signup'
    end
  end

  get '/users/logout' do
    session.clear if session[:user_id]
    erb :'users/goodbye'
  end 
end 
