class FuturesController < ApplicationController

#index
	get '/futures' do
		@futures = Future.create(params[:future_act][]["title"])
		erb :'things/index'
	end 

	get '/futures/new' do 
		if logged_in? 
			erb :'futures/new'
		else 
			redirect to '/users/login'	
		end 
	end 


	post '/future' do
		@future = Future.create(title => params([:title], :user_id => current_user.id))
		if !params["future"]["title"].empty?
			@future.titles << Future.create(title: params["future"]["title"])
		end
		@future.save
		redirect to "/future/#{@future.id}"
	end #how do I get the nested form right as params 

	# post '/things' do
	# 	if logged_in? 
	# 		if current_user && params[:description] != ""
	# 			@thing = Thing.create(:date => params[:date], :title => params[:title], :description => params[:description], :user_id => current_user.id)

	# 			redirect to "/things/#{@thing.id}"
	# 		else 
	# 			redirect to '/things'
	# 		end
	# 	else
	# 		redirect to '/users/login'
	# 	end
	# end 


# post '/owners' do
#   @owner = Owner.create(params[:owner])
#   if !params["pet"]["name"].empty?
#     @owner.pets << Pet.create(name: params["pet"]["name"])
#   end
#   @owner.save
#   redirect to "owners/#{@owner.id}"
# end

end 