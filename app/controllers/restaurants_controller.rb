class RestaurantsController < ApplicationController

    def index 
        @restaurants = Restaurant.all 
        render json: @restaurants
    end 

    def create 
        @restaurant = Restaurant.create!(restaurant_params)
        render json: @restaurant
    end 

    private 

    def restaurant_params
        params.permit(:name, :location, :image_url)
    end 
end
