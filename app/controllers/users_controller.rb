class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def profile
        render json: { user: (current_user) }, status: :accepted
    end

    def index 
        @users = User.all

        render json: @users
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { id: @user.id, username: @user.username, name: @user.name, jwt: @token }, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
    end

    def show
        @user = User.find(params[:id])

        render json: @user
    end

    private

    def user_params
        params.permit(:name, :username, :password)
    end
end