require "rails_helper"

RSpec.describe Sku, :type => :model do
  context "one sku" do
    it "can't create sku without supplier" do
      expect do
        Sku.create!(sku: '12345', name: 'Some Sku')
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "few skus" do
    it "can't insert the same sku twice" do
      supplier = Supplier.create!(name: 'Some Supplier')
      Sku.create!(sku: '12345', supplier_id: supplier.id, name: 'Some Sku')
      expect do
        Sku.create!(sku: '12345', supplier_id: supplier.id, name: 'Some Sku')
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
