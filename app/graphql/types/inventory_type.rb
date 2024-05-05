# frozen_string_literal: true

module Types
  class InventoryType < Types::BaseObject
    field :id, ID, null: false
    field :product_id, Integer, null: false
    field :quantity, Integer
    field :location, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
