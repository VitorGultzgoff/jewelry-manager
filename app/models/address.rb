class Address < ApplicationRecord
  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :customer
end
