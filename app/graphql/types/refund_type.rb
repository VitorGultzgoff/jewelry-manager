# frozen_string_literal: true

module Types
  class RefundType < Types::BaseObject
    field :id, ID, null: false
    field :product_id, Integer, null: false
    field :customer_id, Integer, null: false
    field :reason, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :completed_at, GraphQL::Types::ISO8601DateTime
  end
end
