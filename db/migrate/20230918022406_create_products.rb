# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :status
      t.integer :cost_price
      t.integer :sale_price
      t.boolean :is_third_party

      t.timestamps
    end
  end
end
