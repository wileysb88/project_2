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
      user = User[id: session[:user_id]]
      "Hello Welcome back #{user[:username]}"
    end

  get '/' do
    # @user = User.find_by(id session[:user_id])
    # erb :homepage, locals: { title: 'Homepage' }
    erb :homepage
  end


end
