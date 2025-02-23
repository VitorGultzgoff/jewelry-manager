# frozen_string_literal: true

class AddCustomerIdToActions < ActiveRecord::Migration[7.0]
  def change
    add_column :actions, :customer_id, :integer, null: true
    add_foreign_key :actions, :customers, column: :customer_id, on_delete: :nullify
  end
end
