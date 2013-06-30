class LeaderBoard
  attr_reader :points, :rank
  def initialize(users)
    @users = users
    @lowest_rank = 1
    @current_board = []
  end

  def rankings
    current_rank = 1
    current_score = @users.first.score
    number_passed = 0
    @users.map do |player|
      if current_score > player.score
        current_score = player.score
        current_rank += number_passed 
        number_passed = 0
      end
      number_passed += 1
      [current_rank, player]
    end
  end
end
