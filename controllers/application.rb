class ApplicationController < Sinatra::Base

  # session[:account_message] = ""
  # set folder for templates to ../views, but make the path absolute
  set :public_folder, File.expand_path('../../public', __FILE__)
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions





  before do
    @title ||= 'Homepage'
    @karmaclass = ""
    @current_user = session[:username]
    if session[:logged_in] == true
      user = User[id: session[:current_user_id]]
      if user.karma >= 50
        p "HIGH KaRmA!!!!!!!"
        @karmaclass = "karma-high"
      elsif user.karma < 0
        p "LOW KARMAAA!"
        @karmaclass = "karma-low"
      else
        p "MED KARMAAAA!"
        @karmaclass = "karma-med"
      end
      p @karmaclass
      # p session[:account_message]
    end


    # session[:account_message] = "You are logged in as #{session[:username]}"

    if !session[:logged_in]
      @welcome_message = "
        Word of mouth: by the people, for the people. Don't let big websites tell you what to do, listen to your neighbors! Recommend restaurants by posting details about your favorite spots. Like other user's posts to echo the sentiments! The more likes you get, the more credit you gain as a neighbor! Build up your karma when other users like your posts!"
    end


    # if user = User[id: session[:current_user_id]]

  end

  # Path for testing: Should display current user's username
  get '/whois' do
      user = User[id: session[:current_user_id]]
      "Hello Welcome back #{user[:username]} your karma is #{user[:karma]}"
    end

  get '/' do
    # @user = User.find_by(id session[:user_id])
    bouttosort = Restaurant.all
    @rest_rank = 1
    @user_rank = 1
    @sorted_restaurants = bouttosort.sort_by { |rest| rest[:vote_amount]}.reverse!
    user_to_sort = User.all
    @sorted_users = user_to_sort.sort_by { |user| user[:karma]}.reverse!

    # erb :homepage, locals: { title: 'Homepage' }
    erb :homepage
  end

  # get '/masterlist' do
  #   if !session[:logged_in]
  #     redirect '/users'
  #   end
  #   @restaurants_master = Restaurant.all
  #   @users_master = User.all
  #   erb :master
  # end

  not_found do
    erb :notfound
  end
# <footer> <%= erb :chat %> </footer>

end
