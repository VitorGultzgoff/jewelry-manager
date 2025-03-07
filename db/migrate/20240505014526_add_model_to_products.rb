# frozen_string_literal: true

class AddModelToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :model, null: false, foreign_key: true
  end
end
