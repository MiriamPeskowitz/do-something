require '../config/environment'
require 'sinatra'
# require 'sinatra/base'
# require 'rack-flash'
# require 'pry'

class ApplicationController < Sinatra::Base
#enable sessions
 
 configure do
    enable :sessions
    set :session_secret, "secret" 	
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# question, line 13 could be this, why not?  set :views, Proc.new { File.join(root, "../views/") }
#   set :views, Proc.new { File.join(root, "../views/") }
#  register Sinatra::Twitter::Bootstrap::Assets


  get "/" do
  	session.clear
  	@actss = Act.all
    erb :index
  end

  helpers do
      def logged_in?
        !!session[:user_id]
      end

      def current_user
         User.find(session[:user_id])
      end

      # def flash_sign_up
      #   post '/set-flash' do
      #     flash[:notice] = "Thanks for signing up!"
      #   end
      # end


    end 

end
