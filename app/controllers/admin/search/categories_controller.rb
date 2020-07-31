# frozen_string_literal: true

class Admin::Search::CategoriesController < Admin::BaseController
  def index
    @categories = if params[:name_category].present? # present >< blank
                    Category.search_name(params[:name_category])
                  else
                    Category.none # => returning [] instead breaks the previous code
                  end
  end
end
