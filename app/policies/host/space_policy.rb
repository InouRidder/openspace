class Host::SpacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
