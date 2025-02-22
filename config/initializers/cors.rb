# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:4000'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :delete, :options, :head]
  end
end

