class Space < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable
  has_many :space_properties
  has_many :properties, through: :space_properties

  def html_to_string
    ApplicationController.render(partial: 'spaces/space', locals: { space: self})
  end
end
