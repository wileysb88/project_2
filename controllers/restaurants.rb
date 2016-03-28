class RestaurantsController < ApplicationController


  get '/' do

    erb :homepage
    redirect '/' if !session[:logged_in]

  end


end
