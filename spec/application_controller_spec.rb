require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "responds with a welcome message" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Welcome to the Sinatra Template!")
  end
end

describe "GET '/' - Greeting Form" do
	it "welcomes the user" do
		visit '/'
		expect(page.body).to include("Welcome!")
	end
end 