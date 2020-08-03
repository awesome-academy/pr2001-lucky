# frozen_string_literal: true

module ProductsHelper
  def average_rating(ratings)
    ratings.blank? ? 0 : ratings.map { |x| x.rate.to_i }.sum.to_f / ratings.size
  end
end
