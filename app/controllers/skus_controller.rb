class SkusController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @skus = pagy(Sku.all.includes(:supplier), items: 10)
  end
end
