# frozen_string_literal: true

class ImagesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @images = @product.images
  end

  private

  def image_params
    params.require(:image).permit :product_id
  end
end
