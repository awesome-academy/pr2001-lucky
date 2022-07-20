class OrdersController < ApplicationController
  def new
    @order = current_user.orders.new
    @product_carts = current_cart.product_carts
  end
  def create 
    @order = current_user.orders.build order_params
    if @order.save
      flash[:success] = 'User buyed success'
      redirect_to root_path
    else
      flash[:danger] = 'User buyed fail'
      render :new
    end
  end
  private
  def order_params
    params.require(:order).permit :address, :phone_number, :user_id , :cart_id
  end
end