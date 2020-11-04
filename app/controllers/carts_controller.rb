class CartsController < ApplicationController

    before_action :authorized, only: [:create]

    def index 
        @carts = Cart.all 
        render json: @carts
    end 

    def create 
        @cart = @user.carts.create!(cart_params)
        render json: @cart
    end 

    private
    def cart_params
        params.permit(:cart_id, :history, :order_method)
    end 
end
