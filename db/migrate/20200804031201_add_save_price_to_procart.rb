class AddSavePriceToProcart < ActiveRecord::Migration[6.0]
  def change
    add_column :product_carts, :save_price_to_procart, :integer
  end
end
