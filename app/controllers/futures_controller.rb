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

# use future1, future2, future3 as the names of them, though on the form/erb is looks like 1,2,3. 
#Future.first(3)
# or Future.limit(3).order('id asc') or a version of this. 
	get '/futures/:id' do 
		if !logged_in? && !current_user
			redirect to '/users/login'
	  	else 
	  		
	  		@future = Future.find_by(user_id: current_user.id)
	  		@future.user_id == current_user.id.to_s 	
  		 	# @futures = current_user.futures.all
  		 	flash[:message] = "Great stuff to plan!"
		 	erb :'futures/show'
		 end
	end
	# @user.futures
	# @futures.uniq {|f| f.title }
	

	get '/futures/:id/edit' do
	  if !logged_in? 
	  	 redirect to '/users/login'
	  else
	  	# WHAt do I want to do: pull down the right future.id
	  
	  	 @future= Future.find_by(id: params[:id])
	  	 erb :"futures/edit"	
	  end	  	    	   
	end 

	patch '/futures/:id' do
	  if !logged_in? 
	  	redirect to '/users/login' 
	  else	

        @future = Future.find_by_id(params[:id])   
	    @future.title = params[:future][:title]
	    @future.user_id = current_user.id
	    @future.save
	    redirect to "/futures/#{@future.id}"
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