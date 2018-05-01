class FuturesController < ApplicationController


	get '/futures' do
	  @futures = Future.create(params[:future][]["title"])
	  erb :'things/index'
	end 

	get '/futures/new' do 
	  if logged_in? 
	    erb :'futures/new'
	  else 
		redirect to '/users/login'	
	  end 
	end 

	post '/futures' do
	  if params[:title] != ""
		@future = Future.create(:title => params[:title], :user_id => current_user.id)			
		redirect to "/future/index"
	  else
		redirect to '/'
		flash[:message] = "You're not authorized to view this page."
	  end	
	end 
binding.pry
	get '/futures/:id' do 
	  if !logged_in?
		redirect to '/users/login'	
  	  else
  		@future = Future.find_by_id(params[:id])
		erb :'futures/show'
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