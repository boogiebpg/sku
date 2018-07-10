require "rails_helper"

RSpec.describe Supplier, :type => :model do
  context "few suppliers" do
    it "can't insert the same supplier twice" do
      Supplier.create!(id: '12345', name: 'Some Supplier')
      expect do
        Supplier.create!(id: '12345', name: 'Some Supplier')
      end.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
