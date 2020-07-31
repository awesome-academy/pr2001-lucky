# frozen_string_literal: true

class CreateRating < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end
