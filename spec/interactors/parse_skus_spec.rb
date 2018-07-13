require "rails_helper"

describe ParseSkus do

  describe ".call" do
    context "when given valid args" do

      before do
        Supplier.create(id: 1, name: 'Supplier A')
        Supplier.create(id: 2, name: 'Supplier B')
        ParseSkus.call(filename: Rails.root.join('test', 'fixtures', 'sku.csv'))
      end

      it "parse the file and skip incorrect values" do
        expect(Sku.count).to eq(7)
      end

      it "insert only unique skus" do
        ParseSkus.call(filename: Rails.root.join('test', 'fixtures', 'sku.csv'))
        expect(Sku.count).to eq(7)
      end

      it "insert correct values to DB" do
        expect(Sku.last.sku).to eq('Q69782')
        expect(Sku.last.name).to eq('Brioncefunc Output Viewer')
      end

      it "updates sku with the same sku-value" do
        sku = Sku.find_by_sku('W65985')
        expect(sku.name).to eq('Rewrited Sku')
      end

    end

    context "without corresponding Suppliers" do
      before do
        ParseSkus.call(filename: Rails.root.join('test', 'fixtures', 'sku.csv'))
      end

      it "parse the file and skip incorrect values" do
        expect(Sku.count).to eq(0)
      end
    end

  end
end
