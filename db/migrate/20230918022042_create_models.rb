# frozen_string_literal: true

class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.string :name
      t.string :icon_image_url

      t.timestamps
    end
  end
end
