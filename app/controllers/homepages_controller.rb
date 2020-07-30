# frozen_string_literal: true

class HomepagesController < ApplicationController
  def home
    @foods = Food.order(created_at: :desc).limit(4)
    @drinks = Drink.order(created_at: :desc).limit(4)
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
