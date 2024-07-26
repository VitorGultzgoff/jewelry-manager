# frozen_string_literal: true

# == Schema Information
#
# Table name: sale_products
#
#  id          :integer          not null, primary key
#  sale_id     :integer          not null
#  product_id  :integer          not null
#  final_price :integer
#  discount    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  # Additional attributes
  validates :final_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
