# frozen_string_literal: true

class SeedModels < ActiveRecord::Migration[7.0]
  def up
    models = %w[Chain Bracelet Choker Ring Pendant Earring]

    models.each do |model_name|
      Model.create(name: model_name)
    end
  end

  def down
    models = %w[Chain Bracelet Choker Ring Pendant Earring]

    models.each do |model_name|
      Model.find_by(name: model_name)&.destroy
    end
  end
end
