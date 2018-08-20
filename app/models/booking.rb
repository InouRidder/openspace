class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  has_many :reviews, as: :reviewable

  validate :overlap, on: :create
  validates :end_time, presence: true, date: { after_or_equal_to:  :start_time }, on: :create

  def overlap
    # (StartA <= EndB) and (EndA >= StartB)
    if space.bookings.where('start_time <= ? AND end_time >= ?', self.end_time, self.start_time).any?
      self.errors.add(:start_datetime, "Overlapping dates")
    end
  end

  def can_review?(user)
    completed? && reviews.pluck(:user_id).exclude?(user.id) && (self.user == user || space.user == user)
  end

  def completed?
    approved? && end_date < Time.now
  end

  def approved?
    state == 'approved'
  end

end
