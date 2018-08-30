class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.bookings
    end
  end

  def show?
    owner_or_booker
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  def confirmed?
    is_booker? && record.may_confirm?
  end

  def declined?
    is_owner? && record.may_decline?
  end

  def approved?
    is_owner? && record.may_approve?
  end

  def cancelled?
    owner_or_booker && record.may_cancel?
  end

  private

  def is_owner?
    record.space.user == user
  end

  def is_booker?
    record.user == user
  end

  def owner_or_booker
    is_owner? || is_booker?
  end
end
