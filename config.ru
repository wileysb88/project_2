# require 'sinatra/base'

require 'bundler'
Bundler.require

DB = Sequel.sqlite('development.sqlite')


require './models/user'
require './models/restaurant'

require './controllers/application'
require './controllers/users'
require './controllers/restaurants'



map('/') { run ApplicationController }
map('/users') { run UsersController }
map('/restaurants') { run RestaurantsController }
