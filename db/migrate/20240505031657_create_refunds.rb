# frozen_string_literal: true

class CreateRefunds < ActiveRecord::Migration[7.0]
  def change
    create_table :refunds do |t|
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.text :reason

      t.timestamps
    end
  end
end
