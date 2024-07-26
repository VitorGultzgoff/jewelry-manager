# frozen_string_literal: true

class SeedSuppliers < ActiveRecord::Migration[7.0]
  def up
    suppliers = %w[Haig Paulo Leilão_da_Caixa]

    suppliers.each do |supplier_name|
      Supplier.create(name: supplier_name.gsub('_', ' '))
    end
  end

  def down
    suppliers = %w[Haig Paulo Leilão_da_Caixa]

    suppliers.each do |supplier_name|
      Supplier.find_by(name: supplier_name.gsub('_', ' '))&.destroy
    end
  end
end
