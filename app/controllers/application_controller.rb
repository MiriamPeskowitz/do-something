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

# question, line 13 could be this, why not?  set :views, Proc.new { File.join(root, "../views/") }
#   set :views, Proc.new { File.join(root, "../views/") }
#  register Sinatra::Twitter::Bootstrap::Assets


  get "/" do
  	session.clear
  	@actss = Act.all
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
