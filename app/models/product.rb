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

  scope :search_name, ->(name_product) do
    where("name_product LIKE '%#{name_product}%'")
  end
  
  self.inheritance_column = :kind_of

  def self.kind_ofs
    %w(Drink Food)
  end
end
