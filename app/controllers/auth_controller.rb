class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    def create
        
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])

            token = encode_token({ user_id: @user.id })
            render json: { id: @user.id, username: @user.username, name: @user.name, jwt: token }, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
    end

    def show
        
        string = request.headers['Authorization']

        
        token = JWT.decode(string, "my_s3cr3t")[0]
        id = token['user_id']
        
        @user = User.find(id)

        if @user 
            render json: { id: @user.id, username: @user.username, name: @user.name}
        else
            render json: {error: "Sorry, We are not finding you in our database. Please Register"}, status: 422
        end
    end

    private

    def user_login_params
        params.permit(:username, :password)
    end
end
