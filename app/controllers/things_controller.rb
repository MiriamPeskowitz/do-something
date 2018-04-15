class ThingsController < ApplicationController
	
	get '/things' do
		
		erb :"index"
	end 
 

	# # get '/things' do
	# # 	if logged_in?
	# # 		@things = current_user.things
	# # 		erb :'things/index' 
	# # 	else 
	# # 		redirect to '/users/login'
	# # 	end 
	# # end 


	# get '/things/new' do
	# 	if logged_in? 
	# 		erb :'things/new'
	# 	else 
	# 		redirect to '/users/login'	
	# 	end 
	# end

	# post '/things' do
	# 	if logged_in? 

	# 		if current_user && params[:description] != ""
	# 			# @user = User.find_by(:username => params[:username])
	# 			@thing = Things.create(:title => params[:title], :date => params[:date], :description => params[:description], :user_id => current_user.id)
	
				
	# 			redirect to "/things/#{@things.id}"
			
	# 		else 
	# 			redirect to '/things/new'
	# 		end
	# 	else
	# 		redirect to '/users/login'
	# 	end
	# end 



	# get '/things/:id' do
	# 	if !logged_in?
	# 		redirect to '/users/login'	
	# 	else
	# 		@thing = Thing.find_by(:id => params[:id])
		
	# 		erb :'thing/show'

	# 	end 
	# end 


	# get '/things/:id/edit' do
	# 	
	# 	# @thing = Thing.find_by_slug(params[:slug])
	# 	# @thing.update(params[:title], params[:date], params[:description])

	# 	@thing= Thing.find_by(:id => params[:id])
	# 	if logged_in? && @act
	# 		if current_user.id == @thing.user_id
	# 		  erb :'thing/edit'
	# 		else 
	# 	      redirect to '/thing'
	# 		end 
	# 	else
	# 	  redirect to '/users/login'
	# 	end 
	# end 


	# patch '/thing/:id' do
	# 	@thing = Thing.find_by_id(params[:id])
	# 	redirect to '/users/login' if !logged_in?
	# 	if params[:description] == "" || current_user.id != @act.user_id
	# 		redirect to "/thing/#{@thing.id}/edit"
	# 	else
	# 	    @thing.update(:description => params[:description])
	# 	    redirect to "/things/#{@act.id}"
	# 	end 
	# end 


	# delete '/thing/:id' do
	# 	@thing = Thing.find_by_id(params[:id])
	# 	redirect to "/" if !logged_in?

	# 	if @thing && @thing.user_id == current_user.id
	# 		@thing.delete 
	# 		redirect to '/'
	# 	end
	# end
end



