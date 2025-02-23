# frozen_string_literal: true

class AddQuantityToSaleProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :sale_products, :quantity, :integer, null: false, default: 1
  end
end
