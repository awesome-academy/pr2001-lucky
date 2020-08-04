# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :order
  has_many :product_carts
  has_many :products, through: :product_carts

  has_one :order
  before_save :update_subtotal
  def total_amount
    product_carts.collect do |pr|
      pr.valid? ? (pr.quantity * pr.product&.price.to_i) : 0
    end
  end
  private
  def update_subtotal
    self.total_amount = self.total_amount
  end
end
