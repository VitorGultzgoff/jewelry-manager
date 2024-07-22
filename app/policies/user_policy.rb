# frozen_string_literal: true

class UserPolicy < ::ApplicationPolicy
  def index? = read_permission?

  def show? = read_permission?

  def new? = write_permission?

  def create? = write_permission?

  def edit? = write_permission?

  def update? = write_permission?

  def destroy? = write_permission?

  private

  def read_permission? = any_role?(*read_group)

  def write_permission? = any_role?(*write_group)

  def read_group
    write_group
  end

  def write_group
    [Groups::ADMIN]
  end
end
