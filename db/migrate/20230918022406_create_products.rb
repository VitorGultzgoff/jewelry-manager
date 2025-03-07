# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :status
      t.decimal :cost_price, precision: 10, scale: 2, default: 0.0
      t.decimal :sale_price, precision: 10, scale: 2, default: 0.0
      t.boolean :is_third_party

      t.timestamps
    end
  end
end
