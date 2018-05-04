class FuturesController < ApplicationController

	get '/futures' do
	  @futures = Future.create(:title => params[:title], :user_id => current_user.id)
	  erb :'things/index'
	end 

	get '/futures/new' do 
	  if logged_in? 
	    erb :'futures/new'
	  else 
		redirect to '/users/login'	
	  end 
	end 

	# post '/futures' do
	# 	binding.pry
	 
	# 	@future = Future.new(:title => params[:title], :user_id => current_user.id)			
	#  if params[:title]
	#  	Future.save	
	# 	redirect to "/futures/:id"
	#   else
	# 	redirect to '/'
	# 	flash[:notice] = @user.errors.full_messages.first.join(",")
	# 	# flash[:message] = "You're not authorized to be on this page."
	# 	redirect to '/home'
	#   end	
	# end 


	post '/futures' do
	  if logged_in? 
	  	binding.pry
		if current_user && params[:title] != ""
		  @future = Future.create(:title => params[:title], :user_id => current_user.id)
		  redirect to "/futures/#{@future.id}"
		else 
    	  flash[:notice] = @user.errors.full_messages.first.join(",")
		  redirect to '/things'
		end
	  else
	  	flash[:message] = "You're not authorized to view this page."
		redirect to '/users/login'
	  end
	end 

# use future1, future2, future3 as the names of them, though on the form/erb is looks like 1,2,3. 
#Future.first(3)
# or Future.limit(3).order('id asc') or a version of this. 
	get '/futures/:id' do 
	  if @future && @future.user_id == current_user.id		
  		 @futures = Future.all
		 erb :'futures/show'
	  else 
		redirect to '/users/login'	
	  end 
	end

	
	delete '/futures/:id/delete' do
	  @future = Future.find_by_id(params[:id])
		# redirect to "/" if !logged_in?
	  if @future && @future.user_id == current_user.id
		@future.delete 
		redirect to 'futures/index'
	  else
	    redirect to '/'	
      end
	end
end 