class RestaurantsController < ApplicationController


  get '/' do

    erb :restaurants
    # redirect '/users' if !session[:logged_in]

  end

  get '/all' do

    @restaurants = Restaurant.all
    erb :restaurantlist

  end

  post '/create' do

  poster = session[:current_user_id]

  Restaurant.create poster_id: poster || 1, name: params[:name], description: params[:description], tags: params[:tags], vote_amount: 0, neighborhood: params[:neighborhood]

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
  redirect '/restaurants/all'

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
  redirect '/restaurants/all'

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
