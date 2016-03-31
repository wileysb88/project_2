class ChatController < ApplicationController


  get '/last' do
      # session[:account_message] = "Only registered users can chat"
      # redirect '/users'
    # end

  {
    :id => Chat.last.id,
    :chat_name => User[id: [Chat.last.chatter_id]].username,
    :data => Chat.last.message,
    :latest => Chat.last.latest

  }.to_json

  end

  post '/last' do
    if !session[:logged_in]
      session[:account_message] = "Only registered users can chat"
      redirect '/users'
    end

    puts params

    Chat.create chatter_id: session[:current_user_id] || 1, message: params[:message], buffer: "", latest: true
    puts Chat.last.message
    puts Chat.last.chatter_id
    # redirect '/'
  end


  get '/set' do
    Chat.create chatter_id: 1, message: "this is a test message", buffer: "This is a test buffer", latest: true
    redirect '/'
  end



end
