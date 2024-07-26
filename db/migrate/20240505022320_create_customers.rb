# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :document
      t.string :avatar_url
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
