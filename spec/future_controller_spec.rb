require_relative "spec_helper"


describe "Futures Controller" do 
	describe "new action"  do

		it "can visit '/futures/new' " do 
			get '/futures/new'
			expect(last_response.status).to eq(200)
		end 

		it " 'futures/new' loads form to create a new future item" do 
			visit '/futures/new'
			expect(page).to have_field(:title)
		end 

		it "'futures/new' creates a new future to" do
			@future1 = Future.create(:title => "Do some investigating" )
			visit '/futures/new'
			fill_in "title", :with => "Do some investigating"
			expect(page.current_path).to eq ("futures/#{@future.id}")
		end 

		it "'/futures/new' redirects to '/futures/:id' after form submission"
			@future1 = Future.create(:title => "Do some investigating" )

		end 

		describe ...
	end 
end

	describe Futures do
		describe "#.... " do 
			it "takes in form data/params"
		end 
	end 

	describe "#generate index page" do
		it "generates an index.html file" do
			xxxx = xxxx.new("xxx")

			expect(file).to exist(".../index")
		end
	end 






end 

# on the index, it adds a form: 
what it does --design 
how it works -- code 

