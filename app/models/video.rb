class Video < ActiveRecord::Base
  belongs_to :user

  YT_LINK = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*\z/i

  validates :link, presence: true, format: YT_LINK
end
