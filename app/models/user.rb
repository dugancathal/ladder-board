class User < ActiveRecord::Base
  include Clearance::User

  has_many :players
  has_many :games, through: :players
end
