class ParseSuppliers
  include Interactor

  def call
    File.open(context.filename).each do |line|
      # we can also use CSV.foreach here
      id, name = line.chomp.split('¦')
      unless (id.blank? || name.blank?)
        begin
          Supplier.create!(id: id, name: name)
        rescue ActiveRecord::RecordNotUnique
          Supplier.update(id, name: name)
        end
      end
    end
  end
end
