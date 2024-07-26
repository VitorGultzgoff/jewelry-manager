# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :models, [Types::ModelType], null: false
    field :products, [Types::ProductType], null: false

    def models
      Model.all
    end

    def products
      Product.all
    end
  end
end
