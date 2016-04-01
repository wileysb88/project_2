class RestaurantsController < ApplicationController


  get '/' do
    if !session[:logged_in]
      session[:account_message] = "You must be logged in to post a restaurant"
      redirect '/users'
    end
    erb :restaurants

  end

  get '/all' do

    @restaurants = Restaurant.all
    erb :restaurantlist

  end

  post '/create' do

    name = description = params[:name].gsub("(", " ").gsub("[", " ").gsub("ajax", "No Scripts, no exceptions").gsub("json", "No Scripts, no exceptions").gsub("{", " ").gsub("<", " ").gsub("=", " ")

    description = params[:description].gsub("(", " ").gsub("[", " ").gsub("ajax", "No Scripts, no exceptions").gsub("json", "No Scripts, no exceptions").gsub("{", " ").gsub("<", " ").gsub("=", " ")

    tags = params[:tags].gsub("(", " ").gsub("[", " ").gsub("ajax", "No Scripts, no exceptions").gsub("json", "No Scripts, no exceptions").gsub("{", " ").gsub("<", " ").gsub("=", " ")

  poster = session[:current_user_id]

  Restaurant.create poster_id: poster || 1, name: name, description: description, tags: tags, vote_amount: 0, neighborhood: params[:neighborhood]

  puts params
  redirect '/restaurants/all'

  end

  # Linked to 'upvote' type buttons, will raise a restaurant's votes by 1 and the restaurant poster's karma by 10
  post '/voteup' do

  params[:id]
  rest = Restaurant[id: params[:id]]
  votee = User[id: rest[:poster_id]]
  puts rest
  puts votee
  rest.vote_amount += 1
    # if votee === true
      votee.karma += 10
      votee.save
    # end
  rest.save
  puts params
  redirect '/'

  end

  # As above, but downways instead of upways
  post '/votedown' do

  params[:id]
  rest = Restaurant[id: params[:id]]
  votee = User[id: rest[:poster_id]]
  puts rest
  puts votee
  rest.vote_amount -= 1
    # if votee === true
      votee.karma -= 10
      votee.save
    # end
  rest.save
  puts params
  redirect '/'

  end

  post '/goto' do
    @goto_rest = Restaurant[id: params[:id]]
    user = User[id: [@goto_rest.poster_id]]
    user.karma += 1
    user.save
    erb :restviewer
  end

  post '/delete' do

  params[:id]
  rest = Restaurant[id: params[:id]]
  rest.destroy
  puts params
  redirect '/users/account'

  end

end

# create_table(:restaurants) do
#   primary_key :id
#   Integer :poster_id
#   String :name
#   Text :description
#   String :tags
#   Integer :vote_amount
#   String :neighborhood
# end

# def longest(array)
#   array.max_by(&:length)
# end
