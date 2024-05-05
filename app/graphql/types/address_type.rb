# frozen_string_literal: true

module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :street_address, String
    field :complement, String
    field :zipcode, String
    field :country_id, Integer, null: false
    field :state_id, Integer, null: false
    field :city_id, Integer, null: false
    field :customer_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :streetAddress, String
    field :complement, String
    field :zipcode, String
    field :country, Types::CountryType
    field :state, Types::StateType
    field :city, Types::CityType
    field :customer, Types::CustomerType
  end
end
