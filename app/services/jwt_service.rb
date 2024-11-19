# frozen_string_literal: true

class JwtService
  HMAC_SECRET = Rails.application.credentials.devise[:jwt_secret_key]

  def self.encode(user_id)
    payload = { sub: user_id, exp: (Time.now + 24.hours).to_i }
    JWT.encode(payload, Rails.application.credentials.devise[:jwt_secret_key], 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key], true, { algorithm: 'HS256' }).first
  rescue JWT::DecodeError => _e
    nil
  end
end
