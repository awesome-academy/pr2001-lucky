# frozen_string_literal: true

module ProductsHelper
  def average_rating(ratings)
    ratings.blank? ? 0 : ratings.map { |x| x.rate.to_i }.sum.to_f / ratings.size
  end
  def search_product
    if params[:name_product].present? # present >< blank
      Product.search_name(params[:name_product])
    else
      Product.none # => returning [] instead breaks the previous code
    end
  end
  def search_price
    if params[:price].present?
      Product.search_price(params[:price])
    end  
  end
end
