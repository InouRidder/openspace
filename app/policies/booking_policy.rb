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
    owner_or_booker && record.may_confirm?
  end

  def declined?
    owner_or_booker && record.may_decline?
  end

  def approved?
    owner_or_booker && record.may_approve?

  end

  def cancelled?
    owner_or_booker && record.may_decline?
  end

  private

  def owner_or_booker
    record.user == user || record.space.user == user
  end
end
