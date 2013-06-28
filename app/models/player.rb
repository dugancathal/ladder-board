class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  delegate :email, to: :user
  delegate :email=, to: :user
  def ranking
    current_rank = 1
    current_score = game.players.first.score
    number_passed = 0
    game.players.each do |player|
      if current_score > player.score
        current_score = player.score
        current_rank += number_passed 
        number_passed = 0
      end
      return current_rank if player == self  
      number_passed += 1
    end
  end
end
