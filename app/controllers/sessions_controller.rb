class SessionsController < ApplicationController


# to put the login/signup here, in Sesssions 
# 	get '/registrations/signup' do
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

#render login form
  get '/sessions/login' do
  	if !logged_in?
	  	erb :'sessions/login'
	  else 
		  redirect to '/things' 
    end 
  end

#send login form 
  post '/sessions' do
    #receive Post request, code to grab users info from params hash, match that info against the etnries in db, and if ===, sign in user
    @user = User.find_by(:email => params["email"], :password => params[:password])
    session[:user_id] = @user.id
    redirect '/users/home'
  end

#end session/logout
  get '/sessions/logout' do
    #clear the session 
    session.clear
    redirect '/'
  end

end 