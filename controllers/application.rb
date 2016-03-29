class ApplicationController < Sinatra::Base

  # set folder for templates to ../views, but make the path absolute
  set :public_folder, File.expand_path('../../public', __FILE__)
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions

  before do
    @title ||= 'Homepage'
    @current_user = session[:username]
  end

  # Path for testing: Should display current user's username
  get '/whois' do
      user = User[id: session[:current_user_id]]
      "Hello Welcome back #{user[:username]} your karma is #{user[:karma]}"
    end

  get '/' do
    # @user = User.find_by(id session[:user_id])
    bouttosort = Restaurant.all
    @sorted_restaurants = bouttosort.sort_by { |rest| rest[:vote_amount]}.reverse!


    # erb :homepage, locals: { title: 'Homepage' }
    erb :homepage
  end


end
