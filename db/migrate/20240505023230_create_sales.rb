# frozen_string_literal: true

class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :discount
      t.integer :final_price

      t.timestamps
    end
  end
end
