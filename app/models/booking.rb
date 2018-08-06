class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  has_many :reviews, as: :reviewable

  validate :overlap, on: :create
  validates :end_datetime, presence: true, date: { after_or_equal_to:  :start_datetime }, on: :create

  def overlap
    # (StartA <= EndB) and (EndA >= StartB)
    if space.bookings.where('start_datetime <= ? AND end_datetime >= ?', self.end_datetime, self.start_datetime).any?
      self.errors.add(:start_datetime, "Overlapping dates")
    end
  end

  def can_review?(user)
    completed? && reviews.pluck(:user_id).exclude?(user.id) && (self.user == user || space.user == user)
  end

  def completed?
    approved? && end_datetime < DateTime.now
  end

  def approved?
    state == 'approved'
  end

end
