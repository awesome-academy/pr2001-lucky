# frozen_string_literal: true

class Admin::ImagesController < Admin::BaseController
  before_action :get_product
  def new
    @image = Image.new
  end

  def index
    @images = @product.images.all
  end

  def create
    if params[:image]
      @image = @product.image.build(link: params[:image][:url])
      if @image.save
        flash[:success] = 'Image uploaded'
        redirect_to admin_product_images_path(@product)
      else
        render :new
      end
    else
      flash.now[:danger] = 'You need to choose an image file, please!'
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:success] = 'Your image is deleted successful!'
    redirect_to admin_product_images_path(@product)
  end

  private

  def image_params
    params.require(:image).permit(:url, :product_id)
  end

  def get_product
    @product = Product.find(params[:product_id])
  end
end
