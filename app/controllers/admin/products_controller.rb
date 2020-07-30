# frozen_string_literal: true

class Admin::ProductsController < Admin::BaseController
  before_action :get_product, only: %i[show edit update destroy]
  before_action :logged_in?, only: %i[index new create update destroy]

  def index
    @products = Product.all.page(params[:page]).per(5)
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = 'create successful product'
      redirect_to admin_products_path
    else
      flash[:alert] = 'Product could not be created!'
      render :new
    end
  end

  def edit; end
  

  def update
    if @product.update(product_params)
      flash[:success] = 'Update successfully'
      redirect_to admin_categories_path
    else
      flash[:danger] = 'Product could not be updated'
      render :edit
    end
  end
  def destroy
    @product.destroy
    respond_to do |format|
      format.html {redirect_to admin_product_url, notice: 'Product was successfully destroyed.' }
      format.json {head :no_content}
      format.js
    end
  end
  private
  def product_params
    params.require(:product).permit :name_product, :information, :price, :kind_of, :category_id, images_attributes: %i[url id] # Product::ATTRIBUTES
  end

  def get_product
    @product = Product.find(params[:id])
  end
  def logged_in? # Returns true if the user is logged in
    !current_admin.nil?
  end
end
