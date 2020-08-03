# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :order
  belongs_to :product_cart
end
