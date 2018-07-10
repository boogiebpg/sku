class SuppliersController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @suppliers = pagy(Supplier.all, items: 10)
  end
end
