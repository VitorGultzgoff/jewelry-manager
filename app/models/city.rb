# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string
#  state_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class City < ApplicationRecord
  belongs_to :state
end
