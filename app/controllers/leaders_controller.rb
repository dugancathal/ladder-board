class LeadersController < ApplicationController
  def index
    @users = LeaderBoard.new(User.leaders, :elo_score).rankings
  end
end
