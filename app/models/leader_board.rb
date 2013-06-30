class LeaderBoard
  attr_reader :points, :rank
  def initialize(users, score_method)
    @users = users
    @score_method = score_method
    @lowest_rank = 1
    @current_board = []
  end

  def rankings
    current_rank = 1
    current_score = @users.first.send(@score_method)
    number_passed = 0
    @users.map do |player|
      if current_score > player.send(@score_method)
        current_score = player.send(@score_method)
        current_rank += number_passed 
        number_passed = 0
      end
      number_passed += 1
      [current_rank, player]
    end
  end

  def rank_for_user(user)

  end

end
