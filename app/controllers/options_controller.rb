class OptionsController < ApplicationController

    def index 
        @options = Option.all 
        render json: @options
    end 

    def create
        @option = Option.create!(options_params)
        render json: @option
    end 

    private 

    def options_params
        params.permit(:name)
    end 

end
