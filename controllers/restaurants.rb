class RestaurantsController < ApplicationController


  get '/' do

    erb :restaurantlist
    # redirect '/' if !session[:logged_in]

  end

  get '/all' do

    @restaurants = Restaurant.all
    

    erb :restaurantlist

  end

  post '/create' do

  Restaurant.create name: params[:name], description: params[:description], tags: params[:tags], vote_amount: 0, neighborhood: params[:neighborhood]

  puts params
  redirect '/restaurants/all'

  end

  post '/voteup' do

  params[:id]
  rest = Restaurant[id: params[:id]]
  puts rest
  rest.vote_amount += 1
  rest.save
  puts params
  redirect '/restaurants/all'

  end

  post '/votedown' do

  params[:id]
  rest = Restaurant[id: params[:id]]
  puts rest
  rest.vote_amount -= 1
  rest.save
  puts params
  redirect '/restaurants/all'

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
