# frozen_string_literal: true

class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.references :product, null: false, foreign_key: true
      t.string :action_type, null: false, comment: 'Type of action performed (e.g., Stock, Sell, Consignment, etc.)'
      t.date :executed_at, comment: 'When the action was executed'

      t.timestamps
    end
  end
end
