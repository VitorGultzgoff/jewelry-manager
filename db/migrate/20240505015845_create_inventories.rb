# frozen_string_literal: true

class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.string :location

      t.timestamps
    end
  end
end
