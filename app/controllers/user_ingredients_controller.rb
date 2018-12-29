class UserIngredientsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @userIngredients = UserIngredient.all

        render json: @userIngredients
    end

    def show 
        @userIngredient = UserIngredient.find(params[:id])

        render json: @userIngredient
    end

    def destroy
        @userIngredient = UserIngredient.find(params[:id])

        @userIngredient.destroy

        render json: @userIngredient
    end
end