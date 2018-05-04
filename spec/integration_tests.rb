require 'pry'
describe "Basic Routes Lab" do
  describe "GET '/' " do
    before(:each) do
      get '/'
    end
    it "returns a 200 status code" do
    	expect(last_response.status).to eq(200)
    end 

    it "displays the welcome page" do
    	visit '/'
    	expect(page.body).to include("Do Something Now")
    end

   describe "GET '/signup' " do
   	it "sends a 200 status code" do
   		get '/signup'
   		expect(last_response.status).to eq(200)
   	end
   	it 'renders a signup form' do
	   	visit '/signup'
	   	expect(page).to have_selector("form")
	   	expect(page).to have_field(:username)
	   	expect(page).to have_field(:email)
	   	expect(page).to have_field(:password)
   end

    it "can let a user sign up" do 

    	visit "login" 

    	fill_in("username", with: "Jon")
    	fill_in("email", with: "jon@mail.com")

    	expect(find_field('username').value.to eq "Jon")
    	expect(find_field('email').value.to eq "jon@mail.com")

    end
  end

  	describe "POST '/signup'` " do
  		it "responds with a 200 status code" do
  			post '/signup'
  			expect(last_response.status).to eq(200)
  		end 

  		it "displays the params" do
  			params = {
  				:username => "Jon",
  				:email => "jon@mail.com"
  			}

  		end 
  	end
 end 


