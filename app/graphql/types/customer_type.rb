# frozen_string_literal: true

module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :document, String
    field :avatar_url, String
    field :name, String
    field :email, String
    field :phone, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :document, String
    field :avatarUrl, String
    field :name, String
    field :email, String
    field :phone, String
  end
end
