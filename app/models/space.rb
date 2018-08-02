class Space < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable
  has_many :space_properties
  has_many :properties, through: :space_properties

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  def html_to_string
    ApplicationController.render(partial: 'spaces/space', locals: { space: self})
  end
end
