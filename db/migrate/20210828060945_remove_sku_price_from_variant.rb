class RemoveSkuPriceFromVariant < ActiveRecord::Migration[5.2]
  def change
    remove_column :variants, :sku
    remove_column :variants, :price
  end
end
