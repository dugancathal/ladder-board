class User < ActiveRecord::Base
  include Clearance::User

  has_many :players
  has_many :games, through: :players

  def self.leaders
    where("elo_score <> 1000").order('elo_score DESC')
  end
end
