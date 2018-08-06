class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, as: :reviewable
  has_many :spaces, dependent: :nullify
  has_many :favorites, dependent: :destroy
  has_many :favorited_spaces, through: :favorites, source: :space
  has_many :written_reviews, foreign_key: "user_id", class_name: "Review"
  has_many :bookings
  has_many :spaces_bookings, through: :spaces, source: :bookings

  def favorited?(space)
    favorites.find_by(space: space)
  end

end
