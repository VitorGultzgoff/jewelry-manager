# frozen_string_literal: true

class CreateSaleProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_products do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :discount, precision: 10, scale: 2, default: 0.0
      t.decimal :final_price, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
