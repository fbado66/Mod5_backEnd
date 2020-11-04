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
        params.permit(:name, :image_ulr, :address, :city, :zipcode, :code, :latitude, :longitude)
    end 
end
