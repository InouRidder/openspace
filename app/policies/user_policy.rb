class UserPolicy < ApplicationPolicy

  def edit?
    update?
  end

  def update?
    record == user
  end
end
