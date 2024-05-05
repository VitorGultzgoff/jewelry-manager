# frozen_string_literal: true

module Types
  class SaleType < Types::BaseObject
    field :id, ID, null: false
    field :customer_id, Integer, null: false
    field :discount, Integer
    field :final_price, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :payment_method, String
    field :payment_status, String
    field :schedule_payment_date, GraphQL::Types::ISO8601Date
    field :completed_at, GraphQL::Types::ISO8601DateTime
  end
end
