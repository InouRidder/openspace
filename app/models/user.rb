class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, as: :reviewable
  has_many :spaces, dependent: :nullify

  def written_reviews
    Review.where(user_id: self.id)
  end
end
