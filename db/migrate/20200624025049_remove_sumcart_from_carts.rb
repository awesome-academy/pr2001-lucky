# frozen_string_literal: true

class RemoveSumcartFromCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :sumcart
  end
end
