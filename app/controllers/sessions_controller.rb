class SessionsController < ApplicationController

#render login form
  get '/sessions/login_form' do
  	if !logged_in?
	  	erb :'sessions/login_form'
	  else 
		  redirect to '/things' #??
       #flash notice you're already logged in 
    end 
  end

#submit login form 
  post '/sessions/login_form' do
    #receive Post request, code to grab users info from params hash, match that info against the etnries in db, and if ===, sign in user
    @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
    session[:user_id] = @user.id
    redirect '/things'
  end

#end session/logout
  get '/sessions/logout' do
    #clear the session 
    session.clear
    redirect '/sessions/goodbye'
  end

end 


# to put the login/signup here, in Sesssions 
#   get '/registrations/signup' do
#     erb :'/registrations/signup'
#   end

#   post '/registrations' do
#     puts params
#     @user = User.new(name: params["name"], email: params["email"], password: params[:password])
#     @user.save
#     session[:id] = @user.id

#     #user info into params hash, create new user, sign them in, redicret
#     redirect '/users/home'
#   end