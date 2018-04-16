require 'pry'
class ThingsController < ApplicationController
	
#index all actions for the current user
	get '/things' do
		if logged_in?
			# @user = User.find_by_id(params[:id])
			# @things = Things.find_by()
			# @things = current_user.things
 			@things = User.find(session[:user_id]).things

			erb :'/things/index' 
		else 
			redirect to '/users/login'
		end 
	end 
 # session[:user_id] = @user.id
#get form for new action
	get '/things/new' do
		if logged_in? 
			erb :'things/new'
		else 
			redirect to '/users/login'	
		end 
	end

#send data for new action
	post '/things' do
		if logged_in? 
			if current_user && params[:description] != ""
				@thing = Thing.create(:date => params[:date], :title => params[:title], :description => params[:description], :user_id => current_user.id)

				redirect to "/things/#{@thing.id}"
			else 
				redirect to '/things'
			end
		else
			redirect to '/users/login'
		end
	end 


#show page for the new action
	get '/things/:id' do
		if !logged_in?
			redirect to '/users/login'	
		else
			@thing = Thing.find_by_id(params[:id])
			erb :'things/show'
		end 
	end 

# edit, sends edit form 
	get '/things/:id/edit' do
			
		# @thing = Thing.find_by_slug(params[:slug])
		# @thing.update(params[:title], params[:date], params[:description])

		@thing= Thing.find_by_id(params[:id]) 
	
		if logged_in? #&& @thing.title
		
			if current_user.id == @thing.user_id

			  erb :"things/edit"
			else 
		      redirect to '/things'
		      # erb :"/things/show"
			end 
		else
		  redirect to '/users/login'
		end 
	end 

# take in edited data
	patch '/things/:id' do
		@thing = Thing.find_by_id(params[:id])
		redirect to '/users/login' if !logged_in?

		if params[:description] == "" || current_user.id != @thing.user_id
			redirect to "/things/#{@thing.user_id}/edit"
		else
		    # @thing.update(:description => params[:description])
		   
		    @thing.date = params[:date]
		    @thing.title = params[:title]
		    @thing.description = params[:description]
		    @thing.save
		    redirect to "/things/#{@thing.id}"
		end 
	end 

#delete 
	delete '/things/:id/delete' do
		@thing = Thing.find_by_id(params[:id])
		# redirect to "/" if !logged_in?
		if @thing && @thing.user_id == current_user.id
			@thing.delete 
			redirect to 'users/login'
			# redirect to "/things/#{@thing.id}"
		else
			redirect to '/'	
		end

	end
end



