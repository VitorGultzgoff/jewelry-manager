# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  status      :integer
#  cost_price  :decimal(10, 2)   default(0.0)
#  sale_price  :decimal(10, 2)   default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  model_id    :integer          not null
#  supplier_id :integer
#
class Product < ApplicationRecord
  belongs_to :model
  has_many :sale_products
  has_many :sales, through: :sale_products
  belongs_to :supplier
  has_many :actions
  has_one :inventory
end
