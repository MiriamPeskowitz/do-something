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
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      if @user.save 
        session[:user_id] = @user.id
        flash[:message] = "Great job signing in."
        redirect to '/things'
      else 
        flash[:notice] = @user.errors.full_messages.first.join(",")
         redirect to '/users/signup'  
        # Don't need this, because model authentications. params[:username] == "" || params[:email] == "" || params[:password] == ""
      # session[:message] = "Fill in all fields, please"
      #flash[:warning] = "Fill in all fields, please."
      # flash[:message] = "#{user.errors.full_messages.join(', ')}"
      #flash[:notice] = @user.errors.full_messages.first.join(",")
      #can I use session here if it hasn't been created yet? 
     end
  end

# signup and login get you to the same place. Signup and you don't have to login, 
# because @user is created. 

  get '/users/login' do 
    if !logged_in?
      erb :'users/login' 
    else
      redirect to "/things"
    end
  end

 post '/users/login' do
    @user = User.find_by(:username => params[:username])
    #understand diff of User.find(... )
     
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/things"
    else
      flash[:message] = "Please sign up first."
      redirect to '/users/login'
    end
  end

  get '/users/logout' do
    session.clear if session[:user_id]
    erb :'users/goodbye'
  end 
end 
