# require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

DB = if ENV['RACK_ENV'] == 'production'
  Sequel.connect(ENV['DATABASE_URL'])
else
  Sequel.sqlite('development.sqlite')
end

require './models/user'
require './models/restaurant'
require './models/chat'


require './controllers/application'
require './controllers/users'
require './controllers/restaurants'
require './controllers/chat'




map('/') { run ApplicationController }
map('/users') { run UsersController }
map('/restaurants') { run RestaurantsController }
map('/chat') { run ChatController }
