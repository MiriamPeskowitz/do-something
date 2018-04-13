
class ActionsController < ApplicationController
	

	get '/actions' do
		if logged_in?
			@actions = current_user.actions
			erb :'actions/index' 
		else 
			redirect to '/citizens/login'
		end 
	end 


	get '/actions/new' do
		if logged_in? 
			erb :'actions/new'
		else 
			redirect to '/citizens/login'	
		end 
	end 
	

	post '/actions' do
		if logged_in? 

			if current_user && params[:description] != ""
				# @citizen = Citizen.find_by(:username => params[:username])
				@action = Action.create(:title => params[:title], :date => params[:date], :description => params[:description], :citizen_id => current_user.id)
	
				
				redirect to "/actions/#{@action.id}"
			
			else 
				redirect to '/actions/new'
			end
		else
			redirect to '/citizens/login'
		end
	end 



	get '/actions/:id' do
		if !logged_in?
			redirect to '/citizens/login'	
		else
			@action = Action.find_by(:id => params[:id])
		
			erb :'actions/show'

		end 
	end 


	get '/actions/:id/edit' do
		# possible: use slug? 
		# @action = Action.find_by_slug(params[:slug])
		# @action.update(params[:title], params[:date], params[:description])

		@action= Action.find_by(:id => params[:id])
		if logged_in? && @action
			if current_user.id == @action.citizen_id
				erb :'actions/edit'
			else 
				redirect to '/actions'
			end 
		else
		redirect to '/citizens/login'
		end 
	end 


	patch '/actions/:id' do
		@action = Action.find_by_id(params[:id])
		redirect to '/citizens/login' if !logged_in?
		if params[:description] == "" || current_user.id != @action.citizen_id
			redirect to "/actions/#{@action.id}/edit"
		else
		    @action.update(:description => params[:description])
		    redirect to "/actions/#{@action.id}"
		end 
	end 


	delete '/actions/:id' do
		@action = Action.find_by_id(params[:id])
		redirect to "/" if !logged_in?

		if @action && @action.citizen_id == current_user.id
			@action.delete 
			redirect to '/'
		end
	end
end



