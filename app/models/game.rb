class Game < ActiveRecord::Base
  has_many :players, -> { order("score DESC") }, dependent: :destroy
  has_many :users, through: :players

  accepts_nested_attributes_for :players, allow_destroy: true
end
