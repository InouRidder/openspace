class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true, length: { minimum: 30 }
end
