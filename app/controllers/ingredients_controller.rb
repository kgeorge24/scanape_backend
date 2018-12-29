class IngredientsController < ApplicationController

    skip_before_action :authorized, only: [:show, :update]

    def index
        @ingredients = Ingredient.all

        render json: @ingredients
    end

    def show
        @ingredient = Ingredient.find(params[:id])

        render json: @ingredient
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        # byebug
        @ingredient.update(ingredients_params)
        # byebug
        render json: @ingredient
    end

    def destroy
        @ingredient = Ingredient.find(params[:id])

        @ingredient.destroy

        render json: @ingredient
    end

    private

    def ingredients_params
        params.require(:ingredient).permit(:quantity)
    end
end