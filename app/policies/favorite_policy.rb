class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.favorited_spaces
    end
  end
end
