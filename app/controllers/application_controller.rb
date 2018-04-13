require './config/environment'

class ApplicationController < Sinatra::Base

#enable sessions
  enable :sessions
  set :session_secret, "action_secret" 	
  use Rack::Flash


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
  	session.clear
  	@actions = Act.all
    erb :'index'
  end

  helpers do
      def logged_in?
        !!session[:user_id]
      end

      def current_user
         User.find(session[:user_id])
      end
    end 

end
