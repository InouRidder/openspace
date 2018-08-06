class Space < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable
  has_many :space_properties, dependent: :destroy
  has_many :properties, through: :space_properties
  has_many :favorites, dependent: :destroy
  has_many :bookings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def set_properties(property_ids)
    property_ids.each { |property_id| SpaceProperty.create(property_id: property_id, space: self) }
  end

  def update_properties(property_ids)
    to_destroy = self.properties.pluck(:id) - property_ids.map(&:to_i)
    property_ids.each do |property_id|
      unless SpaceProperty.exists?(space: self, property_id: property_id)
        SpaceProperty.create(space: self, property_id: property_id)
      end
    end
    to_destroy.each { |space_property_id| SpaceProperty.find_by(space: self, property: space_property_id).destroy }
  end

  # TO DO: Use collections to render the JSON file. Need to figure out a better way, looping and partial rendering is slow!

  def partial_to_string
    ApplicationController.render(partial: 'spaces/space', locals: { space: self, favorite: Favorite.new })
  end

  def partial_map_box
    "<h1> #{title} </h1>"
  end
end
