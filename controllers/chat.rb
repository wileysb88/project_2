class ChatController < ApplicationController


  get '/last' do
      # session[:account_message] = "Only registered users can chat"
      # redirect '/users'
    # end

  {
    :chat_name => User[id: [Chat.last.chatter_id]].username,
    :data => Chat.last.message,
    :latest => Chat.last.latest

  }.to_json

  end

  post '/last' do
    # if !session[:logged_in]
    #   session[:account_message] = "Only registered users can chat"
    #   redirect '/users'
    # end

    puts params
    Chat.create chatter_id: session[:current_user_id], message: params[:message], buffer: "", latest: true
    puts Chat.last.message
    puts Chat.last.chatter_id
    # redirect '/'
  end


  get '/set' do
    Chat.create chatter_id: 1, message: "this is a test message", buffer: "This is a test buffer", latest: true
    redirect '/'
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
