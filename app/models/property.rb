class Property < ApplicationRecord
  has_many :space_properties
  has_many :spaces, through: :space_properties
end
