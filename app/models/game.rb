class Game < ActiveRecord::Base
  has_many :players, -> { order("score DESC") }, dependent: :destroy
  has_many :users, through: :players

  accepts_nested_attributes_for :players, allow_destroy: true

  ELO_D_FACTOR = 400

  def update_elos
    players.each do |player|
      estimated_score(player)
    end
  end

  def estimated_score(player)
    players.map do |other|
      next 0 if other == player
      (1 /
        (1 + 10 ** ((other.rank - player.rank) / 
        ELO_D_FACTOR))
      ) /
      effective_two_player_games
    end.inject(:+)
  end

  def new_elo(player)
    player.elo_score + (
      player.rank + elo_k_factor(player) * (
        score_for(player) - estimated_score(player)
      )
    )
  end

  def score_for(player)
    ( players.count - player.ranking ) / effective_two_player_games
  end

  def effective_two_player_games
    (players.count * (players.count - 1)) / 2.0
  end

  def elo_k_factor(player)
    800.0 / (player.user.games.count * 2)
  end

  def self.by_day
    where(date: (Date.today - 1.month)..(Date.today + 1.month))
      .group_by {|game| game.date }
  end
end
