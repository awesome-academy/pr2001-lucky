# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(12)
  end

  def show
    @product = Product.find(params[:id])
    @product_cart = @product.product_carts.build
    if logged_in_user?
      user_rating = current_user.ratings.find_by(product_id: params[:id])
      @rating =
        if user_rating.present?
          user_rating
        else
          current_user.ratings.build(product_id: params[:id])
        end
    end
  end
end
