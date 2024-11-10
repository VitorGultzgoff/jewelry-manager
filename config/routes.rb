# frozen_string_literal: true

Rails.application.routes.draw do
  # GraphQl setup
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'

  # Authentication setup
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions'
  }
end
