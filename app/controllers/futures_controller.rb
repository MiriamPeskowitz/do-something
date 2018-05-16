class FuturesController < ApplicationController

	get '/futures' do
	  @futures = User.find(session[:user_id]).futures
	  # @futures = Future.create(:title => params[:title], :user_id => current_user.id)
	  erb :'futures/index'
	end 


	get '/futures/new' do 
	  if logged_in? 
	    erb :'futures/new'
	  else 
		redirect to '/users/login'	
	  end 
	end 

	post '/futures' do
	  if !logged_in? && !current_user
	  	flash[:message] = "You are not able to edit this page."
		redirect to '/users/login'
	  else
	  	  @future = Future.create(:title => params[:future][:title], :user_id => current_user.id)
		  redirect to "/futures/#{@future.id}"
	  end
	end 

# To input 3 at a time, use future1, future2, future3 as the names of them, though on the form/erb is looks like 1,2,3. 
#Future.first(3)
# or Future.limit(3).order('id asc') or a version of this. 
	get '/futures/:id' do 
		if !logged_in? && !current_user
			redirect to '/users/login'
	  	else 
	  		@future = Future.find_by(id: params[:id])
  		 	# @futures = current_user.futures.all
  		 	# @future.user_id = current_user.id.to_s
  		 	flash[:message] = "Great stuff to plan!"
		 	erb :'futures/show'
		 end
	end
	# @user.futures
	
	
	get '/futures/:id/edit' do
		@future= Future.find_by(:id => params[:id]) 
  	if current_user.id == @future.user_id
			erb :"futures/edit"
		else
		 redirect to '/users/login'
	 	end	  	    	   
	end 


# patch vs put? 

	patch '/futures/:id' do
		@future = Future.find_by_id(params[:id])  
		if current_user.id == @future.user_id
			@future.update(params[:future])
			redirect to "/futures/#{@future.id}"
		else
			redirect to '/users/login' 
	  end 
	end 
# did this manually, could be @future = Future.find(params[:id]), @future.update(params: future)


	delete '/futures/:id/delete' do
		# redirect to "/" if !logged_in?
	  if @future && @future.user_id == current_user.id.to_s
		 @future = Future.delete(params[:id])
		 redirect to '/futures/index'
	  else
	  	flash[:message] = "Something went wrong."
	    redirect to "/futures/#{@future.id}"	
      end
	end
end 