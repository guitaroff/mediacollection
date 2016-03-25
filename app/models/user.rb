class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :pictures, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :songs, dependent: :destroy
end
