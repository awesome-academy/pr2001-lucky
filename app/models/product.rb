# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :product_carts
  accepts_nested_attributes_for :images
  belongs_to :category
  validates :name_product, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: true
  validates :information, presence: true, length: { maximum: 255 }
end
