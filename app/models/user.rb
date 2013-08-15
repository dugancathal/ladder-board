require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
  include Clearance::User

  has_many :players
  has_many :games, through: :players

  #mount_uploader :avatar, AvatarUploader

  def self.leaders
    where("score <> 1000").order('score DESC')
  end
end
