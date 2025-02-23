# frozen_string_literal: true

# == Schema Information
#
# Table name: actions
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null
#  action_type :string           not null
#  executed_at :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Action < ApplicationRecord
  belongs_to :product
  belongs_to :customer, optional: true

  validates :action_type, presence: true
end
