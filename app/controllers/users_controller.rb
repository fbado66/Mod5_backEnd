class UsersController < ApplicationController

    before_action :authorized, only: [:keep_logged_in]

    def login
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            user_tkn = encode_token({user_id: @user.id})

            render json: {
                user: UserSerializer.new(@user), 
                token: user_tkn
            }

        else
            render json: {error: "INCORRECT USERNAME OR PASSWORD"}, status: 422
        end
    end


    def index 
        @users = User.all 
        render json: @users
    end 

    def create 
        @user = User.create!(user_params)
        if @user.valid?
            user_tkn = encode_token({user_id: @user.id})
            render json: {
                user: UserSerializer.new(@user),
                token: user_tkn
        }
        else
            render json: {error: "Invalid User"}, status: 422
        end 
    end 


    def keep_logged_in
        user_tkn = encode_token({user_id: @user.id})

        render json: {
            user: UserSerializer.new(@user), 
            token: user_tkn
        }
    end


    def show 
        @user = User.find(params[:id])
        render json: @user
    end 

    # def create 
    #     @user = User.create!(user_params)
    #     render json: @user
    # end 

    private 

    def user_params
        params.permit(:name, :email, :address, :phone_number, :password)
    end 
end
