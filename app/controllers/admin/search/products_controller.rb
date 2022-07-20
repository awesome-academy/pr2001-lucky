# frozen_string_literal: true

class Admin::Search::ProductsController < Admin::BaseController
  include ProductsHelper
  def index
    @products = search_product
  end
end
