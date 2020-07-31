# frozen_string_literal: true

class Admin::Search::ProductsController < Admin::BaseController
  def index
    @products = if params[:name_product].present? # present >< blank
                  Product.search_name(params[:name_product])
                else
                  Product.none # => returning [] instead breaks the previous code
                end
  end
end
