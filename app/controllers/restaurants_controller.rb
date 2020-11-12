class RestaurantsController < ApplicationController

    def index 
        @restaurants = Restaurant.all 
        render json: @restaurants
    end 

    def create 
        @restaurant = Restaurant.create!(restaurant_params)
        render json: @restaurant
    end 

    def show 
        @restaurant = Restaurant.find(params[:id])
        render json: @restaurant
    end 

    private 

    def restaurant_params
        params.permit(:name, :image_ulr, :address, :cuisines, :city, :zipcode, :code, :latitude, :longitude, :phone_number, :price, :timings, :user_rating, :user_rating_text, :reviews_count)
    end 
end
