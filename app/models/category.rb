# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name_category, presence: true

  scope :search_name, lambda { |name_category|
    where("name_category LIKE '%#{name_category}%'")
  }
end
