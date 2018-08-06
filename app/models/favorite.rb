class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :user, uniqueness: { scope: :space }
end
