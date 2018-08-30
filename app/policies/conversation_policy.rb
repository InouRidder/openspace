class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.conversations
    end
  end

  def show?
    record.users.include?(user)
  end
end
