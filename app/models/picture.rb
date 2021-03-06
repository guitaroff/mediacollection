class Picture < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  belongs_to :user

  validates :image, presence: true
end
