class RatingsController < ApplicationController
    include SessionsHelper
    before_action :get_values_user , only: [:create]
    before_action :get_values_product, only: [:index]
    def index
        @ratings = @product.ratings
    end
    def create
        @product = Product.find(rating_params[:product_id])
        @rating = Rating.new rating_params
        @rating.user = current_user
        respond_to do |format|
            if @rating.save
                format.js   
            else
                format.js
            end
        end
    end
    def update
        @product = Product.find(rating_params[:product_id])
        @rating = Rating.find_by(product_id: @product.id, user_id: params[:user_id])
        respond_to do |format|
            if @rating.update rating_params
                format.js   
            else
                format.js
            end
        end
    end
    private
    def get_values_product
        @product = Product.find(params[:product_id])
    end
    def get_values_user
        @user = User.find(params[:user_id]) 
    end
    def rating_params
        params.require(:rating).permit :rate, :product_id
    end
end
