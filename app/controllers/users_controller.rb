
class UsersController < ApplicationController
    # use Rack::Flash
  # get '/users/:slug' do
  #   @user = User.find_by_slug(params[:slug])
  #   erb :'users/show'
  # end


  get '/users/signup' do
    if !logged_in?
      erb :'users/signup'#, locals: {message: "Please sign up before you sign in"}
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
      redirect to '/tweets'
    end
  end
# signup and login get you to the same place. Signup and you don't have to login \
# because @user is created. 


  get '/users/login' do 
    if !logged_in?
      erb :'users/login'
    else
      redirect '/things'
    end
  end

 post '/users/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/things"
    else
      redirect to '/signup'
    end
  end


end 

# #render signup form 
#  get '/users/signup_form' do
#     if logged_in? 
#         redirect to '/' # how do I respond -- you're already logged in, then what? 
#     else
#         erb :'users/signup_form'
#     end 
#   end

#   post '/users/signup_form' do 
#     if params[:username] == '' ||  params[:email] ==  "" || params[:password] == ""
#       redirect to '/users/signup_form'
#     # add flash notice
#     else
#       @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
#       session[:user_id] = @user.id
#       erb :'/users/login_form'
#     end 
#   end 


# #render login form
#   get '/users/login_form' do
#     if !logged_in?
#       erb :'users/login_form'
#     else 
#       redirect to '/things' #??
#        #flash notice you're already logged in 
#     end 
#   end


# #submit login form 
#   post '/users/login' do
#     #receive Post request, code to grab users info from params hash, match that info against the etnries in db, and if ===, sign in user
#     # @user = User.find_by(:username => params[:username], :email => params[:email], :password => params[:password])
#     # session[:user_id] = @user.id
#     # redirect '/things'
#     # @user = User.find_by(:username => params[:username])
# binding.pry
#     # @user = User.find_by(:username => params[:username])
#     #     if user != nil && @user.password == params[:password]
# stuck in how to do this, can't think my way through 

#     @user = User.create(:username => params[:username], :email => params[:email], :password => password)
#        if user != nil && @user.password == params[:password]
#        session[:user_id] = @user.id
#        redirect to '/things'
#     else
#       redirect to '/'
#       # ?add flash notice
#     end
#   end

#   get '/users/logout' do
#     #clear the session 
#     session.clear
#     redirect '/users/goodbye'
#   end
# end

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

