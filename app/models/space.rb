class Space < ApplicationRecord
  belongs_to :user
  has_many :space_properties, dependent: :destroy
  has_many :properties, through: :space_properties
  has_many :favorites, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :space_attachments
  accepts_nested_attributes_for :space_attachments


  validates :address, :capacity, :price_per_hour, :price_per_day, :opens, :closes, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :user_is_host

  def user_is_host
    return if user.is_host?
    user.host = true
    user.save
  end

  def set_properties(property_ids)
    property_ids.each { |property_id| SpaceProperty.create(property_id: property_id, space: self) }
  end

  def update_photos(photos)
    photos.each do |photo|
      SpaceAttachment.create(space: self, photo: photo)
    end
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

  def partial_to_string
    ApplicationController.render(partial: 'spaces/space', locals: { space: self, favorite: Favorite.new })
  end

  def partial_map_box
    "<h1> #{title} </h1>"
  end

  def self.working_hours
    # Using a 1970 as a zero point
    start_time = Time.new(1970, 1, 1) # start on day january first
    end_time = Time.new(1970, 1, 2, 8) # end time can be chosen until january second 8 in the morning
    times = []
    while start_time < end_time
      times << [start_time.strftime('%I:%M %p'), start_time.strftime('%a, %e %b %Y %H:%M:%S')]
      start_time += 1800
    end
    times
  end

  def open_hours
    times = []
    open_incremental = opens
    until open_incremental > closes
      times << [open_incremental.strftime('%I:%M %p'), open_incremental.strftime('%a, %e %b %Y %H:%M:%S')]
      open_incremental += 1800
    end
    {
      start: times[0..-((minimum_booking_hours * 2) + 1)],
      end: times[(minimum_booking_hours * 2)..-1]
    }
  end
end
