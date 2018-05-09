require './config/environment'
require 'sinatra/base'
require 'sinatra/flash'  

class ApplicationController < Sinatra::Base
 
 configure do
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "secret" 	
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
  	@things = Thing.all.last(30)
    erb :"welcome"
  end

  helpers do
    def logged_in? # same as 'is authenticated?'
      !!session[:user_id]
    end

    def current_user # same as "is authorized"
      @user = User.find_by(:id => session[:user_id]) if session[:user_id]

         
    end
  end 
end

# alternatives
# # def require_logged_in
#   if 

# def is_authenticated?
#   return !!session[:user_id]
# end 

# def require_logged_in
#   redirect to '/login' unless is_authenticated
# end 