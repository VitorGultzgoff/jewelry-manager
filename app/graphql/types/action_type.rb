# frozen_string_literal: true

module Types
  class ActionType < Types::BaseObject
    field :id, ID, null: false
    field :product_id, Integer, null: false
    field :action_type, String, null: false
    field :executed_at, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
