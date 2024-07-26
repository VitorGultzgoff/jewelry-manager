# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :roles

  validates :name, :email, :encrypted_password, presence: true
  validates :email, uniqueness: true

  def any_role?(roles)
    roles.any? { |curr_role| role?(curr_role) }
  end

  def role?(role_name)
    roles.exists?(name: role_name)
  end
end
