class ParseSuppliers
  include Interactor

  def call
    File.readlines(context.filename, chomp: true).each do |line|
      # we can also use CSV.foreach here
      id, name = line.split('¦')
      next if id.blank? || name.blank?
      begin
        Supplier.create!(id: id, name: name)
      rescue ActiveRecord::RecordNotUnique
        Supplier.update(id, name: name)
      end
    end
  end
end
