# frozen_string_literal: true

class AddCompletedAtToRefunds < ActiveRecord::Migration[7.0]
  def change
    add_column :refunds, :completed_at, :datetime
  end
end
