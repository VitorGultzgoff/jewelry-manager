# frozen_string_literal: true

class AddCompletedAtToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :completed_at, :datetime
  end
end
