class AddSupplierToSkus < ActiveRecord::Migration[5.1]
  def change
    add_reference :skus, :supplier, foreign_key: true
  end
end
