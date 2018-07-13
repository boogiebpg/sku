require "rails_helper"

describe ParseSuppliers do

  describe ".call" do
    context "when given valid args" do

      before do
        ParseSuppliers.call(filename: Rails.root.join('test', 'fixtures', 'suppliers.csv'))
      end

      it "parse the file and skip incorrect values" do
        expect(Supplier.count).to eq(7)
      end

      it "insert correct values to DB" do
        expect(Supplier.last.id).to eq(59287)
        expect(Supplier.last.name).to eq('Ward LLC')
      end

      it "updates supplier with the same id" do
        supplier = Supplier.find(750)
        expect(supplier.name).to eq('Rewrited Supplier')
      end

      it "insert only unique suppliers" do
        ParseSuppliers.call(filename: Rails.root.join('test', 'fixtures', 'suppliers.csv'))
        expect(Supplier.count).to eq(7)
      end

    end

  end
end
