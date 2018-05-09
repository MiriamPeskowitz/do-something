require 'spec_helper'

describe "ApplicationController" do

  describe "GET '/'" do
    it "returns a 200 status code" do 
      get '/'
      expect(last_response.status).to eq(200)
    end
    
    # it "loads @things = Thing.all" do
    #   TODO -- ask for a specific -- must load first  before: 
    # end

    it "renders the Welcome page" do 
      get '/'
      expect(last_response.body).to include('<h1>Do Something Now </h1>')  
    end

  end

  describe "GET '/login'" do 
    it "returns a 200 status code" do 
      get '/users/login'
      expect(last_response.status).to eq(200)
    end
    
    it "renders login form" do
      visit '/users/login'
        expect(page).to have_selector(:form)
        expect(page).to have_field(:username)
        expect(page).to have_field(:email)
  end 

  describe "POST '/users/login" do
    before do
      @user1 = User.create(:username => "Miriam", :email => "miriam@mail.com", :password => "miriammiriam")
    end

    it "returns a 302 redirect status code"
      params = {
        :username => "Miriam", :email => "miriam@mail.com", :password => "miriammiriam")
      }
      post '/users/login', params
      expect(last_response.status).to eq(302)
    end
  end


#note -- 200 -- would be a rendering to the same url, 302 would be a new url )
  describe "GET '/users/signup'" do 

    it "returns a 200 status" code do 
      get '/users/signup'
      expect(last_response.status).to eq(200)
    end 

    it "renders the signup page" do
      expect some element from users/signup.erb
    end

    it "redirects to 'things' if user is already logged in" do 
      expect some element from things/index.erb
    end     
  end 

  describe "POST
   '/users/signup'" do 

    before do 
      @user1 = User.create(:username => "Miriam", :email => "miriam@mail.com", :password => "miriammiriam")
    end 

    it "returns a 302 redirect status code" do
      params = {
        :username => "Miriam", :email => "miriam@mail.com", :password => "miriammiriam")
      }
      post '/user/signup', params
      expect(last_response.status).to eq(302)
    end

    it "sets the session[:user] equal to user.id" do 
      post '/user/signup', {:username => "Miriam", :email => "miriam@mail.com", :password => "miriammiriam")}
      follow_redirect!
      expect(session[:user.id]).to eq(1) #is this right-- eq(1)? 
    end 

    it "expects an element from 'things/index'" do 
      expect(last_response.body).to include("<h2>Small daily actions add up.</h2>")

    end


    it "displays the correct username, based on session[:user] and current_user helper" do 
      post '/signup', {:username => "Miriam", :email => "miriam@mail.com", :password => "miriammiriam")}
      follow_redirect!
      expect(last_response.body).to include("Welcome, Miriam")
    end 

  end 


  describe "GET '/logout'" do
    it "clears the session" do
      user1 = User.create(:username => "Miriam", :email => "miriam@mail.com", :password => "miriammiriam")
      params = {
        :username => "Miriam", :email => "miriam@mail.com", :password => "miriammiriam")
      } 
      post '/login', params
      get '/logout'
      expect(session["user_id"]).to be(nil)
    end

    it "redirects to '/users/goodbye'" do
      get "/logout"
      follow_redirect!
      expect(last_response.path_info).to eq('/users/goodbye')

    end 
  end

end



# describe Actions do
#   describe #... do 
#     before do
#       @thing = Thing.new(:date => "Monday", :title => "    ". :description =>  "had a great time") 
#       @user = User.new(:name = "", :email = "")
#     end 

#     describe "..." do 
#       it "should do X" do 
#         expect(@xxx). to be_complete
#       end 

#       describe "LLL" do 
#         it "has a title and a description" do 
#           expect(@thing.title and .... )
#         end
#       end 
#     end 

#     -- hard to figure out the tests 


# describe "the signin process"
#   before :each do 
#   end 
  
#   it 'signs me in' do
#     visit '/users/signin' 
#     within(#session) do
#     fill_in "Email", with 'user@mail.com'
#     fill_in "Password", with: 'password'

# code from applicationcontroller -- 


#   get "/" do
#     session.clear
#     @things = Thing.all
#     erb :welcome
#   end

#   helpers do
#       def logged_in?
#         !!session[:user_id]
#       end

#       def current_user
#          User.find(session[:user_id])
#       end
