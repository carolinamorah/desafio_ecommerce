class AddSkuPriceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price, :decimal
    add_column :products, :sku, :string
    add_column :products, :stock, :integer
  end
end
