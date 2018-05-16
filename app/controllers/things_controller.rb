class ThingsController < ApplicationController
	

	get '/things' do
	  if logged_in?
			@things = User.find(session[:user_id]).things
			erb :'/things/index' 
	  else 	
			redirect to '/users/login'
	  end 
	end 

	get '/things/new' do
	  if logged_in? 
			erb :'things/new'
	  else 
			redirect to '/users/login'	
	  end 
	end

	post '/things' do
		if current_user #&& params[:title] != "" -- not needed, validation for presence done in model 
		  @thing = Thing.new(:date => params[:thing][:date], :title => params[:thing][:title], :description => params[:thing][:description], :user_id => current_user.id)
			if @thing.save
				flash[:message] = "You got this!"
		  	redirect to "/things/#{@thing.id}" # should be render 
			else 
				flash[:message] = "Enter all the fields!"
				erb :"things/new"
		 end
	  else
	  	flash[:message] = "You're not authorized to view this page."
			redirect to '/users/login'
	  end
	end 

	get '/things/:id' do 
		if current_user
			@thing = Thing.find_by(:id =>params[:id])
			flash[:message] = "Awesome stuff!"
			erb :'things/show'
		else 
			redirect to '/users/login'	
	  else
	  end 
	end 

	get '/things/:id/edit' do
	  @thing= Thing.find_by(:id => params[:id]) 		
	  if current_user.id == @thing.user_id	
			erb :"things/edit"
		else
	    redirect to '/users/login'
	  end 
	end 


	patch '/things/:id' do
		@thing = Thing.find_by_id(params[:id])
		if current_user.id == @thing.user_id
			@thing.update(params[:thing])
			redirect to "/things/#{@thing.id}"
		else
			redirect to '/users/login'
	  end 
	end 


	delete '/things/:id/delete' do
	  @thing = Thing.find_by_id(params[:id])
		# redirect to "/" if !logged_in?
	  if @thing && @thing.user_id == current_user.id
			@thing.delete 
			redirect to 'users/login'
	  else
			redirect to '/'	
	  end
	end
end



