class Admin::Search::CategoriesController < Admin::BaseController
    def index
      if params[:name_category].present? #present >< blank
            @categories = Category.search_name(params[:name_category])
      else
            @categories = Category.none # => returning [] instead breaks the previous code
      end
    end
end
