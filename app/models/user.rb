# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  encrypted_password :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  has_and_belongs_to_many :roles

  validates :email, :encrypted_password, presence: true
  validates :email, uniqueness: true

  def self.create_user_and_generate_token(email:, password:, roles: [])
    user = User.create!(email:, password:)
    roles.each do |role_name|
      role = Role.find_or_create_by!(name: role_name)
      user.roles << role unless user.roles.include?(role)
    end
    token = JwtService.encode(user_id: user.id)
    { user:, token: }
  end

  def any_role?(roles)
    roles.any? { |curr_role| role?(curr_role) }
  end

  def role?(role_name)
    roles.exists?(name: role_name)
  end
end
