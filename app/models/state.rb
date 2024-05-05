# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string
#  country_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class State < ApplicationRecord
  belongs_to :country
end
