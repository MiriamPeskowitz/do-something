require 'bundler'

Bundler.require

require_all 'app'

ActiveRecord::Base.establish_connection({
  :adapter => 'sqlite3',
  :database => "db/development.sqlite3"
}) 


# require 'bundler/setup'
# require 'bundler'
# Bundler.require

# require_all 'app'


# # (:default ENV['SINATRA_ENV'])

# # ENV['SINATRA_ENV'] ||= "development"

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
#   # :database => "db/development.sqlite3"
# )


# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
# require "/app/controllers/application_controller.rb"
# # require_all 'lib'

