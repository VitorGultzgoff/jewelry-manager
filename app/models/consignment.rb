# == Schema Information
#
# Table name: consignments
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null
#  customer_id :integer          not null
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Consignment < ApplicationRecord
  belongs_to :product
  belongs_to :customer
end
