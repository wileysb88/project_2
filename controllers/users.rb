class UsersController < ApplicationController


  get '/' do

    erb :homepage
    redirect '/' if !session[:logged_in]

  end












 #-----------  VVVVVVVVVV        Test Paths

  get '/all' do

    @users = User.all
    erb :loginlist

  end


  post '/logout' do
    params[:id]
    user = User[id: params[:id]]
    puts user
    user.logged_in = false
    user.save
    puts params
    redirect '/users/all'
  end

  # ---- Test page should display the current user
  get '/whois' do
      user = User[id: session[:current_user_id]]
      "Hello Welcome back #{user[:username]}"
  end


  post '/create' do
    password = BCrypt::Password.create(params[:password])

    User.create username: params[:username], password: password, logged_in: true
    user = User[username: params[:username]]

    session[:logged_in] = true
    session[:username] = params[:username]
    session[:current_user_id] = user[:id]

    logged_in = user[:logged_in]

    "hello your password hash is #{password} Welcome back! are you logged in? #{logged_in}"

  end




  post '/login' do
    # session[:user_id] = User.authenticate(params).id
    user = User[username: params[:username]]

    compare_to = BCrypt::Password.new(user.password)
    if user && compare_to == params[:password]
      session[:logged_in] = true
      session[:username] = params[:username]
      session[:current_user_id] = user[:id]
      user.logged_in = true
      user.save
      # "Welcome back #{params[:username]}! your session info is #{session[:username]} #{session[:logged_in]}"
      redirect '/users/all/logged'

    else
      "You failed your password check, roll again"
    end

  end


  get '/logout/?' do

    @logoutuser = User[id: session[:current_user_id]]
    @logoutuser.logged_in = false
    @logoutuser.save
    session[:logged_in] = false

  end




end
