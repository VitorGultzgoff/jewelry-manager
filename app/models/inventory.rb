# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  quantity   :integer
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Inventory < ApplicationRecord
  belongs_to :product
end
