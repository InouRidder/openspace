class Property < ApplicationRecord
  has_many :space_properties
  has_many :spaces, through: :space_properties
  scope :features, -> {where(kind: 'feature')}
  scope :space_types, -> {where(kind: 'space_type')}
  scope :activity_types, -> {where(kind: 'activity_type')}
end
