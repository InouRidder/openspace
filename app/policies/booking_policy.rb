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

  def update_state?
    true
    # This needs to be thought through. BookingStateController? state machine?
  end

  private

  def owner_or_booker
    record.user == user || record.space.user == user
  end
end
