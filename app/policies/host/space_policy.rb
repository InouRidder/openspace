class Host::SpacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.spaces
    end
  end
end
