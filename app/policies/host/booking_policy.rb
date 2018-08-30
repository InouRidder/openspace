class Host::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.spaces_bookings
    end
  end
end
