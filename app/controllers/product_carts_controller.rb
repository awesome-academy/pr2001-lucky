class ProductCartsController < ApplicationController
  include SessionsHelper
  def create
    if logged_in_user?
      @cart = current_cart
      @product_cart = @cart.product_carts.build(product_cart_params)
      respond_to do |format|
        if @cart.save
          save_cart(@cart) 
          format.html { redirect_to cart_path(current_cart.id), notice: 'Add successfull'  }
          format.js
        else
          format.html { redirect_to product_path(product_cart_params[:product_id]),
          notice: 'Error, Please add again' }
          format.js
        end
      end
    else
      flash[:danger] = 'You need to login before buy somthing!'
      redirect_to user_login_path
    end
  end
  def update
    @product_cart = ProductCart.find(params[:id])
    respond_to do |format|
      if @product_cart.update_attributes(product_cart_params)
        @cart = @product_cart.cart
        @product_carts = @product_cart.cart.product_carts
        format.html { redirect_to cart_path(current_cart.id), notice: 'Update product in cart successfull.' }
        format.js  
      else
        format.html { redirect_to cart_path(current_cart.id), notice: 'Update product in cart failed.' }
        format.js
      end
    end
  end

  def destroy
    @product_cart = ProductCart.find(params[:id])
    respond_to do |format|
      if @product_cart.destroy
        format.html { redirect_to cart_path(current_cart.id), notice: 'Update product in cart successfull.' }
        format.js  
      else
        format.html { redirect_to cart_path(current_cart.id), notice: 'Update product in cart failed.' }
        format.js
      end
    end
  end

  private  
  def product_cart_params
    params.require(:product_cart).permit :quantity, :product_id, :total_product , :save_price_to_procart
  end
end
