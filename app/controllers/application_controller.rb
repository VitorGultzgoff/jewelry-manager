# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  rescue_from ActionController::RoutingError, with: :render_unauthorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      decoded_token = JwtService.decode(token)
      if decoded_token
        @current_user = User.find_by(id: decoded_token['sub'])
        render_unauthorized unless @current_user
      else
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Authentication missing' }, status: :unauthorized
    end
  end

  def render_unauthorized
    render json: { error: 'Unauthorized access - You need to sign in to access this resource' }, status: :unauthorized
  end

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action' }, status: :forbidden
  end
end
