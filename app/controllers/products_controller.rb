class ProductsController < ApplicationController

    def index 
        @products = Product.all 
        render json: @products
    end 

    def create 
        @product = Product.create!(product_params)
        render json: @product
    end 

    private 

    def product_params
        params.permit(:name, :price, :image_url, :restaurant_id, :category)
    end 
end
