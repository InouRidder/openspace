class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, as: :reviewable
  has_many :spaces, dependent: :nullify
  has_many :favorites, dependent: :destroy

  def written_reviews
    Review.where(user_id: self.id)
  end

  def favorited?(space)
    favorites.find_by(space: space)
  end

end
