# require 'sinatra/base'

require 'bundler'
Bundler.require

DB = Sequel.sqlite('development.sqlite')


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
