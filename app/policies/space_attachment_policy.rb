class SpaceAttachmentPolicy < ApplicationPolicy

  def destroy?
    record.space.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
