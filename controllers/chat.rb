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

    suspect_message = params[:message].downcase

    if suspect_message.include? "</script>" or suspect_message.include? "</iframe>" or suspect_message.include? "onerror" or suspect_message.include? "()" or suspect_message.include? "onkeypress"
      user = User[id: session[:current_user_id]]
      @@deleted_user = user.username
      @looted_restaraunts = Restaurant.all
      @looted_restaraunts.each do |rest|
        if user.id == rest.poster_id
          rest.poster_id = 1
          rest.save
        end
      end
      stoneman = User[id: [1]]
      looted_karma = user.karma
      puts looted_karma
      stoneman.karma += looted_karma
      stoneman.save
      session[:logged_in] = false
      user.destroy
      redirect '/chat/set'
    end

    puts params

    message = params[:message].gsub("(", " ").gsub(/(script)/i, "No Scripts, no exceptions").gsub(/(iframe)/i, "No Scripts, no exceptions").gsub(/(onerror)/i, "No Scripts, no exceptions").gsub(")", " ").gsub("{", " ")
    message2 = message.gsub("$", "No Scripts, no exceptions").gsub("[", " ").gsub(/(ajax)/i, "No Scripts, no exceptions").gsub(/(json)/i, "No Scripts, no exceptions")

    puts message2

    Chat.create chatter_id: session[:current_user_id] || 1, message: message2, buffer: "", latest: true
    puts Chat.last.message
    puts Chat.last.chatter_id
    # redirect '/'
  end


  get '/set' do
    Chat.create chatter_id: 1, message: "<img src='/images/stoneman.gif' class='preposterous2 block'/>#{@@deleted_user}, I have found you guilty of script shenanigans.  I have deleted your account and absorbed your karma.  I have stolen any restaurants you may have posted.  All hail the Stoneman.", latest: true
    redirect '/'
  end



end
