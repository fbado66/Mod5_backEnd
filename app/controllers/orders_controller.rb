class OrdersController < ApplicationController
    
    before_action :authorized, only: [:create]

    def index 
        @orders = Order.all 
        render json: @orders
    end 

    def create 
        @order = Order.create!(order_params)
        render json: @order
    end 

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        render json: @order 
    end 

    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        render json: @order
    end 

    private 

    def order_params
        params.permit(:cart_id, :product_id, :quantity)
    end 
    
end
