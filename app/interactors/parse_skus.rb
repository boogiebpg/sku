class ParseSkus
  include Interactor

  def call
    File.open(context.filename).each do |line|
      sku,
      supplier_id,
      name,
      add_field1,
      add_field2,
      add_field3,
      add_field4,
      add_field5,
      price = line.chomp.split('¦')
      unless (sku.blank? || supplier_id.blank? || name.blank? || price.blank?)
        begin
          Sku.create!(sku:         sku,
                      supplier_id: supplier_id,
                      name:        name,
                      add_field1:  add_field1,
                      add_field2:  add_field2,
                      add_field3:  add_field3,
                      add_field4:  add_field4,
                      add_field5:  add_field5,
                      price:       price)
        rescue ActiveRecord::RecordInvalid
          Sku.where(sku: sku).update_all(supplier_id: supplier_id,
                                         name:        name,
                                         add_field1:  add_field1,
                                         add_field2:  add_field2,
                                         add_field3:  add_field3,
                                         add_field4:  add_field4,
                                         add_field5:  add_field5,
                                         price:       price)
        end
      end
    end
  end
end
