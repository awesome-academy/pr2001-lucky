class RemoveSavePriceToProcart < ActiveRecord::Migration[6.0]
  def change
    remove_column :product_carts, :save_price_to_procart 
  end
end
