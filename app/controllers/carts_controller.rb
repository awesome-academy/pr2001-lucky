class CartsController < ApplicationController
  def index
    @cart = current_cart
    @product_carts = @cart.product_carts.includes(:product).order(created_at: :desc)
  end
end
