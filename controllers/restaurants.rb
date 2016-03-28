class RestaurantsController < ApplicationController


  get '/' do

    erb :homepage
    redirect '/' if !session[:logged_in]

  end

  get '/all' do

    @restaurants = Restaurant.all
    erb :restaurantlist

  end


end
