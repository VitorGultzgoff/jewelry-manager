# frozen_string_literal: true

module Types
  class ModelType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :icon_image_url, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
