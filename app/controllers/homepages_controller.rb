# frozen_string_literal: true

class HomepagesController < ApplicationController
  def home
    @foods = Food.limit_product
    @drinks = Drink.limit_product
  end

  def food
    @foods = Food.all
  end

  def drink
    @drinks = Drink.all
  end

  def sale
    @products = Product.order(create_at: :desc).offset(4)
  end
end
