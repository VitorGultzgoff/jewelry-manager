# frozen_string_literal: true

# == Schema Information
#
# Table name: sale_products
#
#  id          :integer          not null, primary key
#  sale_id     :integer          not null
#  product_id  :integer          not null
#  discount    :decimal(10, 2)   default(0.0)
#  final_price :decimal(10, 2)   default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  # Additional attributes
  validates :final_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
