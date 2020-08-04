class Search::ProductsController  < ApplicationController
  include ProductsHelper
  def index
    @products = search_product
  end
end
