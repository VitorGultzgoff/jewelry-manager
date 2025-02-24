# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  def create
    user = User.find_for_database_authentication(email: params[:email])

    if user&.valid_password?(params[:password])
      token = JwtService.encode(user)
      render json: { token:, user: }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
