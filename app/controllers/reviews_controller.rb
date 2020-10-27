class ReviewsController < ApplicationController

    def index 
        @reviews = Review.all 
        render json: @orders
    end 

    def create 
        @review = Review.create!(review_params)
        render json: @review
    end 

    private 

    def review_params
        params.permit(:restaurant_id, :user_id, :content, :rating)
    end 
    
end
