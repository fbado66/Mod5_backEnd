class CartsController < ApplicationController

    def index 
        @carts = Cart.all 
        render json: @carts
    end 

    def create 
        @cart = Cart.create!(cart_params)
        render json: @cart
    end 

    private
    def cart_params
        params.permit(:user_id, :history, :method)
    end 
end
