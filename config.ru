# require 'sinatra/base'

require 'bundler'
Bundler.require

DB = Sequel.sqlite('development.sqlite')


require './models/user'

require './controllers/application'
require './controllers/users'


map('/') { run ApplicationController }
map('/users') { run UsersController }
