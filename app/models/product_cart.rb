# frozen_string_literal: true

class ProductCart < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_save :get_save_price_to_procart

  def product_cart_price
    if persisted?
      self.save_price_to_procart
    else
      product.price
    end
  end
  def total_product
    product_cart_price*quantity
  end
  private
  def get_save_price_to_procart
    self.save_price_to_procart = self.product.price
  end
end
