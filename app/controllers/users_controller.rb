
class UsersController < ApplicationController
 # helpers Sinatra::RedirectWithFlash  

  get '/users/signup' do
   
    if !logged_in?

      erb :'users/signup'
    else
      redirect to '/things'
    end
  end

  post '/users/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
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
      # session[:try_again_message] = "Please sign up first."
      erb :'users/login' 
    else
      redirect to "/things", :flash => "Success, you are logged in."
    end
  end

 post '/users/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/things"
    else
      redirect to '/users/signup'
    end
  end

  get '/users/logout' do
    session.clear
    erb :'users/goodbye'

  end 
end 
