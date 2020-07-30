class Admin::Search::ProductsController < Admin::BaseController
    def index
      if params[:name_product].present? #present >< blank
        @products = Product.search_name(params[:name_product])
      else
        @products = Product.none # => returning [] instead breaks the previous code
      end
    end
end
