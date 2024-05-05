# == Schema Information
#
# Table name: models
#
#  id             :integer          not null, primary key
#  name           :string
#  icon_image_url :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Model < ApplicationRecord
  has_and_belongs_to_many :products
end
