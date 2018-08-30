class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :reviews, as: :reviewable

  before_save :set_total_price

  validate :overlap, on: :create
  validates :end_time, presence: true, date: { after_or_equal_to:  :start_time }, on: :create

  scope :confirmed, -> { where.not(state: 'unconfirmed') }

  include AASM
  aasm column: 'state' do
    state :pending, :initial => true
    state :confirmed, :approved, :cancelled, :declined

    event :approve do
      transitions :from => :confirmed, :to => :approved
    end

    event :confirm do
      transitions :from => :pending, :to => :confirmed
    end

    event :cancel do
      transitions :from => [:confirmed, :pending, :approved], :to => :cancelled
    end

    event :decline do
      transitions :from => :confirmed, :to => :declined
    end
  end

  def overlap
    # (StartA <= EndB) and (EndA >= StartB)
    if space.bookings.where(date: date).where('start_time <= ? AND end_time >= ?', self.end_time, self.start_time).any?
      self.errors.add(:start_datetime, "The property is not available for that time and specific date")
    end
  end

  def update_state(new_state)
    self.state = new_state
    self.save
  end

  def total_hours
    ((end_time - start_time) / 3600)
  end

  def set_total_price
    self.total_price =  total_hours * space.price_per_hour
  end

  def can_review?(user)
    completed? && reviews.pluck(:user_id).exclude?(user.id) && (self.user == user || space.user == user)
  end

  def completed?
    approved? && date < Time.now
  end

end
