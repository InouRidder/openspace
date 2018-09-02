class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :spaces, dependent: :nullify
  has_many :favorites, dependent: :destroy
  has_many :favorited_spaces, through: :favorites, source: :space
  has_many :written_reviews, foreign_key: "user_id", class_name: "Review", dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :spaces_bookings, through: :spaces, source: :bookings
  has_many :subscriptions, dependent: :destroy
  has_many :conversations, through: :subscriptions
  has_many :messages, dependent: :destroy

  def favorited?(space)
    favorites.find_by(space: space)
  end


  def is_host?
    self.host
  end

  def full_name
    if first_name && last_name
      first_name.capitalize + " " + last_name.capitalize
    elsif first_name
      first_name.capitalize
    else
      ""
    end
  end

  def confirmed?
    true
    # validations on user, email / phone
  end

end
