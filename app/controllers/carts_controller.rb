class CartsController < ApplicationController
  def index
    @cart = current_cart
    @product_carts = @cart.product_carts.includes(:product).order(created_at: :desc)
    @order = current_cart.order
  end 
  private
  def cart_params
    params.require(:cart).permit :total_amount
  end
end
