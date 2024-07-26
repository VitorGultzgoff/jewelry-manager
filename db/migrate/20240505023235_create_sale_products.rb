# frozen_string_literal: true

class CreateSaleProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_products do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :final_price
      t.integer :discount

      t.timestamps
    end
  end
end
