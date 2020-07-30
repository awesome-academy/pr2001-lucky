# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name_category, presence: true

  scope :search_name, ->(name_category) do
    where("name_category LIKE '%#{name_category}%'")
  end
end
