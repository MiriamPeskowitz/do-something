class ThingsController < ApplicationController

#index
	get '/future_acts' do
		erb :'future_acts/index'
	end 

	get 'future_acts/new' do 
		erb :'future_acts/new'
	end 

	post 'future_acts' do
		@future_acts = Future_Acts.create(:title => params[:title])
	end 

end 