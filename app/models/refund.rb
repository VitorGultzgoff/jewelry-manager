# frozen_string_literal: true

# == Schema Information
#
# Table name: refunds
#
#  id           :integer          not null, primary key
#  product_id   :integer          not null
#  customer_id  :integer          not null
#  reason       :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  completed_at :datetime
#
class Refund < ApplicationRecord
  belongs_to :product
  belongs_to :customer
end
