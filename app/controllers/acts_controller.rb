class ActsController < ApplicationController
	

	get '/acts' do
		if logged_in?
			@acts = current_user.acts
			erb :'acts/index' 
		else 
			redirect to '/users/login'
		end 
	end 


	get '/acts/new' do
		if logged_in? 
			erb :'acts/new'
		else 
			redirect to '/users/login'	
		end 
	end 
	

	post '/acts' do
		if logged_in? 

			if current_user && params[:description] != ""
				# @citizen = Citizen.find_by(:username => params[:username])
				@act = Acts.create(:title => params[:title], :date => params[:date], :description => params[:description], :user_id => current_user.id)
	
				
				redirect to "/acts/#{@acts.id}"
			
			else 
				redirect to '/acts/new'
			end
		else
			redirect to '/users/login'
		end
	end 



	get '/acts/:id' do
		if !logged_in?
			redirect to '/users/login'	
		else
			@act = Acts.find_by(:id => params[:id])
		
			erb :'acts/show'

		end 
	end 


	get '/acts/:id/edit' do
		# possible: use slug? 
		# @action = Action.find_by_slug(params[:slug])
		# @action.update(params[:title], params[:date], params[:description])

		@act= Act.find_by(:id => params[:id])
		if logged_in? && @act
			if current_user.id == @act.user_id
				erb :'acts/edit'
			else 
				redirect to '/acts'
			end 
		else
		redirect to '/users/login'
		end 
	end 


	patch '/acts/:id' do
		@act = Act.find_by_id(params[:id])
		redirect to '/users/login' if !logged_in?
		if params[:description] == "" || current_user.id != @act.user_id
			redirect to "/acts/#{@act.id}/edit"
		else
		    @act.update(:description => params[:description])
		    redirect to "/acts/#{@act.id}"
		end 
	end 


	delete '/acts/:id' do
		@act = Act.find_by_id(params[:id])
		redirect to "/" if !logged_in?

		if @act && @act.user_id == current_user.id
			@act.delete 
			redirect to '/'
		end
	end
end



