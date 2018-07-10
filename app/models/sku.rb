class Sku < ApplicationRecord
  belongs_to :supplier

  validates_uniqueness_of :sku
end
