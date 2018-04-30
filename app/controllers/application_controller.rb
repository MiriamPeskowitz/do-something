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
  	@things = Thing.all
    erb :"welcome"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
         # or User.find_by(id: session[:user_id])
    end
  end 
end
