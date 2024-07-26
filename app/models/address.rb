# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  street_address :string
#  complement     :string
#  zipcode        :string
#  country_id     :integer          not null
#  state_id       :integer          not null
#  city_id        :integer          not null
#  customer_id    :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :customer
end
