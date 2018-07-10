require "rails_helper"

describe ParseUploadedFile do

  describe ".call" do
    context "when given valid args" do

      it "runs ParseSkus iterator" do
        file = Rails.root.join('test', 'fixtures', 'skus.csv')
        allow_any_instance_of(ParseSkus).to receive(:call)
        ParseUploadedFile.call(filename:          file,
                               original_filename: 'skus.csv')
      end

      it "runs ParseSuppliers iterator" do
        file = Rails.root.join('test', 'fixtures', 'suppliers.csv')
        allow_any_instance_of(ParseSuppliers).to receive(:call)
        ParseUploadedFile.call(filename:          file,
                               original_filename: 'suppliers.csv')
      end

    end

  end
end
