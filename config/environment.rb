require 'pry'
ENV['SINATRA_ENV']||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/development.sqlite3"
   # :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
) 

# require_all 'app'


# # Ask: what is this, used in some sinatra files: 
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
