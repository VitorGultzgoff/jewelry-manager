# frozen_string_literal: true

# == Schema Information
#
# Table name: sales
#
#  id                    :integer          not null, primary key
#  customer_id           :integer          not null
#  discount              :integer
#  final_price           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  payment_method        :string
#  payment_status        :string
#  schedule_payment_date :date
#  completed_at          :datetime
#
class Sale < ApplicationRecord
  belongs_to :customer
  has_many :sale_products
  has_many :products, through: :sale_products
end
