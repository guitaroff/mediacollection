class Song < ActiveRecord::Base
  belongs_to :user

  SOUND_LINK = /((http:\/\/(soundcloud\.com\/.*|soundcloud\.com\/.*\/.*|soundcloud\.com\/.*\/sets\/.*|soundcloud\.com\/groups\/.*|snd\.sc\/.*))|(https:\/\/(soundcloud\.com\/.*|soundcloud\.com\/.*\/.*|soundcloud\.com\/.*\/sets\/.*|soundcloud\.com\/groups\/.*)))/i

  validates :title, presence: true
  validates :link, presence: true
  validate :link_format

  def soundcloud?
    SOUND_LINK =~ link
  end

  private

  def link_format
    if !(soundcloud?)
      errors.add(:link, I18n.t('user.sound_link_error'))
    end
  end
end
