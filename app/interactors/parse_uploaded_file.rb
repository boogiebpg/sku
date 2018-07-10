class ParseUploadedFile
  include Interactor

  def call
    case context.original_filename
    when 'suppliers.csv'
      ParseSuppliers.call(filename: context.filename)
    when 'sku.csv'
      ParseSkus.call(filename: context.filename)
    end
  end
end
