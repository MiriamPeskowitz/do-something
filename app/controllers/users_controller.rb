
class UsersController < ApplicationController
    # use Rack::Flash

#render login form
  get '/users/login_form' do
    if !logged_in?
      erb :'users/login_form'
    else 
      redirect to '/things' #??
       #flash notice you're already logged in 
    end 
  end


#submit login form 
  post '/users/login' do
    #receive Post request, code to grab users info from params hash, match that info against the etnries in db, and if ===, sign in user
    # @user = User.find_by(:username => params[:username], :email => params[:email], :password => params[:password])
    # session[:user_id] = @user.id
    # redirect '/things'
    # @user = User.find_by(:username => params[:username])
    @user = User.create(:username => params[:username], :email => params[:email], :password => password)
    if @user != nil && @user.password == params[:password]
       session[:user_id] = @user.id
       binding.pry
       redirect to '/things'
    else
      redirect to '/'
      # ?add flash notice
    end
  end

  get '/users/logout' do
    #clear the session 
    session.clear
    redirect '/users/goodbye'
  end
end

  #  	post '/users/login' do
  #     redirect to '/things' if logged_in?
  #     @user = User.find_by(username: params[:username])
      
  # 	 	if @user && @user.authenticate(params[:password])
  # 	 		 session[:user_id] = @user.id
  # 		   redirect to '/things'
  # 	  else
  #         # flash[:notice] = "You've got a lot on your mind, but we do need a valid Username and Password."
  # 	 	    redirect to '/'
  # 	  end
  #  	end 

  #   get '/users/index' do
  #       @things = Thing.all
  #       erb :'users/index'
  #   end 

  
  # 	get '/sessions/logout' do
  # 		if logged_in?
  # 			session.clear
  # 			erb :'sessions/logout'
  # 		else 
  # 			redirect to '/sessions/login_form'
  # 		end 
  # 	end 

  # end

  # move signups into other controllers so that this is restful 

    # get '/users/signup' do
    
    #   if logged_in? 
    #     redirect to '/actions' 
    #   else
    #     erb :'users/signup'
    #   end 
    # end

    # post '/users/signup' do 
    #   if params[:username] == '' ||  params[:email] ==  "" || params[:password] == ""
        
   #      redirect to '/users/signup'
    #   else
    #     @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
   #      session[:user_id] = @user.id
    #     redirect to '/acts'
    #   end 
    # end 

   
 

    # get '/users/login' do
    
    #   if !logged_in?
    #      erb :'users/login'
    #   else
    #      redirect to '/acts'
    #   end 
    # end   

