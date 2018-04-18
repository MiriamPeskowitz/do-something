

some of them are below - 

what does users do? 
	it allows a user to signup 
		tests that a user is logged in 

	it  sends the form to signup 

	it posts/recieves the form back, and checks that the params are filled 

	if all is good is saves the signup 

	if all is good it creates a session 

	if all is good it redirects back to /things index

	if not signed in, redirects to users/signup 


	it allows users to login 
		if user isn't logged in, it renders the users/login form
		
	it posts the login form 

	it takes the user params and uses them to create a new User. 

	it redirects to /things index

	if user isn't created and isn't authenticated, it redirects to /users/signup	

# def app
#   ApplicationController
# end


# describe ApplicationController do
#   it "clears the session, if it exists" do
#     get '/'
#     expect(last_response.status).to eq(200)
#     expect(last_response.body).to include("Welcome to the Sinatra Template!")
#   end
# end

# describe "GET '/' - Greeting Form" do
# 	it "renders the welcome page' do
# 		visit '/'
# 		expect(page.body).to include("Welcome!")
# 	end
# end 


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
