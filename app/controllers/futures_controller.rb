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

#DEBUG HERE 
	post '/futures' do
	  if logged_in? 
	  	if current_user
	  	  @future = Future.create(:title => params[:future][:title], :user_id => current_user.id)
		  redirect to "/futures/#{@future.id}"
		else 
		  flash[:message] = "You are not able to edit this page"	
		  redirect to '/things'
		end
	  else
	  	flash[:message] = "You are not authorized to view this page."
		redirect to '/users/login'
	  end
	end 

# use future1, future2, future3 as the names of them, though on the form/erb is looks like 1,2,3. 
#Future.first(3)
# or Future.limit(3).order('id asc') or a version of this. 
	get '/futures/:id' do 
		if !logged_in? 
			redirect to '/users/login'
	  	else 
	  		@futures = Future.all
	  		# @future.user_id.to_i == current_user.id	 	
  		 	# @futures = current_user.futures.all
  		 	flash[:message] = "Great stuff to plan!"
		 	erb :'futures/show'
		 end
	end
	# @user.futures
	# @futures.uniq {|f| f.title }
	
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