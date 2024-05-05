# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  status         :integer
#  cost_price     :integer
#  sale_price     :integer
#  is_third_party :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  model_id       :integer          not null
#
class Product < ApplicationRecord
  belongs_to :model
end
