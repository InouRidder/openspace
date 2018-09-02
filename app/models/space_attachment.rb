class SpaceAttachment < ApplicationRecord
  belongs_to :space
  mount_uploader :photo, PhotoUploader
end
