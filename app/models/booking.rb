class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validate :overlap
  validates :end_datetime, presence: true, date: { after_or_equal_to:  :start_datetime }, on: :create

  def overlap
    # (StartA <= EndB) and (EndA >= StartB)
    if space.bookings.where('start_datetime <= ? AND end_datetime >= ?', self.end_datetime, self.start_datetime).any?
      self.errors.add(:start_datetime, "The dates are overlapping with another booking")
    end
  end

end
