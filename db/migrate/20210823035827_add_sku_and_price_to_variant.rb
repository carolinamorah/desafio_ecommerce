class AddSkuAndPriceToVariant < ActiveRecord::Migration[5.2]
  def change
    add_column :variants, :sku, :string
    add_column :variants, :price, :decimal
  end
end
