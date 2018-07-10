class AddIndexToSkus < ActiveRecord::Migration[5.1]
  def change
    add_index :skus, :sku, unique: true
  end
end
