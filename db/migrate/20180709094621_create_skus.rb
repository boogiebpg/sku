class CreateSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :skus do |t|
      t.string :sku
      t.string :name
      t.string :add_field1
      t.string :add_field2
      t.string :add_field3
      t.string :add_field4
      t.string :add_field5
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
