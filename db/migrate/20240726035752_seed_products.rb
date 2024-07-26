# frozen_string_literal: true

class SeedProducts < ActiveRecord::Migration[7.0]
  def up
    statuses = %w[Stock Consigned Sold Dismantled Lost Canceled]

    statuses.each do |status|
      Model.find_each do |model|
        Supplier.find_each do |supplier|
          Product.create(
            name: "#{model.name} #{status}",
            status:,
            cost_price: rand(100..500),
            sale_price: rand(600..1000),
            model:,
            supplier:
          )
        end
      end
    end
  end

  def down
    Product.destroy_all
  end
end
