# == Schema Information
#
# Table name: sales
#
#  id          :integer          not null, primary key
#  customer_id :integer          not null
#  discount    :integer
#  final_price :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sale < ApplicationRecord
  belongs_to :customer
  has_many :sale_products
  has_many :products, through: :sale_products
end
