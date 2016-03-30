class UsersController < ApplicationController

  get '/' do

    erb :login
    # redirect '/' if !session[:logged_in]

  end












 #-----------  VVVVVVVVVV        Test Paths

  get '/account' do
    if !session[:logged_in]
      redirect '/users'
    end
    @vote_class = ""
    @restaurants_list = Restaurant.all
    @update_user = User[id: session[:current_user_id]]
    erb :account


  end

  post '/update' do
    user = User[id: session[:current_user_id]]
    password = BCrypt::Password.create(params[:password_new])
    puts user[:id]
    puts password
    user.password = password
    user.save
    puts user.password
    p "IT UPDATED THE PASSWORD!"
    redirect '/'
    @account_message = "Your password has been updated."
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

    @all_users = User.all
    @all_users.each do |user|
      if (user.username == params[:username])
        status 403
      end
    end

    password = BCrypt::Password.create(params[:password])
    # if params[:username] != User.all.each[:username]
      User.create username: params[:username], password: password, logged_in: true, karma: 0
      user = User[username: params[:username]]

      session[:logged_in] = true
      session[:username] = params[:username]
      session[:current_user_id] = user[:id]

      logged_in = user[:logged_in]
      @account_message = "Welcome to our site!"
      redirect '/'
    # "hello your name is #{sessions[:username]} Welcome back! are you logged in? #{logged_in}"

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
      # "hello you are #{session[:username]} Welcome back! Your id is #{session[:current_user_id]} and your karma is #{user[:karma]}"
      @account_message = "Welcome back!"
      p @account_message
      redirect '/'


    else
      @account_message = "Your password was wrong.  Try again or call the admin at (800) No-Admin"
      p @account_message
      redirect '/users'
    end

  end


  get '/logout/?' do

    @logoutuser = User[id: session[:current_user_id]]
    @logoutuser.logged_in = false
    @logoutuser.save
    session[:logged_in] = false
    @account_message = "You have logged out."
    p @account_message
    redirect '/'

  end




end
