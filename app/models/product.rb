# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :product_carts
  has_many :ratings
  belongs_to :category

  accepts_nested_attributes_for :images

  validates :name_product, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: true
  validates :information, presence: true, length: { maximum: 255 }

  scope :search_name, lambda { |name_product|
    where("name_product LIKE '%#{name_product}%'")
  }
  scope :search_price, lambda { |price|
    where("price BETWEEN '%#{price_1}%' AND '%#{price_2}%'")
  }

  # PRICE_RANGE = {0: (1..8), 1: (9..100), 2: (101: 100000)}
  
  def self.limit_product
    order(created_at: :desc).limit(4)
  end

  self.inheritance_column = :kind_of

  def self.kind_ofs
    %w[Drink Food]
  end
end
# Product::PRICE_RANGE["0"]