class ScansController < ApplicationController 
    skip_before_action :authorized, only: [:create]

    def index
        @scans = Scan.all 

        render json: @scans
    end

    def create
        # byebug
        @scan = Scan.create(scan_params)
        @ingredient = @scan.getInfo
        # if @scan.save
        # byebug


        render json: @ingredient
        # else
        #     render json: @scan.errors.full_messages
        # end
    end

    def show
        @scan = Scan.find(params[:id])

        render json: @scan
    end

    private

    def scan_params
        params.require(:scan).permit(:barcode, :user_id)
    end

    # def ingredient_params
    #     params.requrie(:ingredient).permit(:title, :description)
    # end
end