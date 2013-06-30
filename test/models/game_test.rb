require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @game = Factory(:game)
    @players = [:tj, :robin, :emily, :dan].map {|user| Factory(user) }
    @game.players = @players
    @game.reload
  end

  test 'players are ordered by score' do
    assert_equal @players.sort_by{|player| player.score}.reverse, @game.players
  end

  test "a player knows it's rank in a game" do
    assert_equal 1, @game.players[0].ranking
    assert_equal 2, @game.players[1].ranking
    assert_equal 3, @game.players[2].ranking
    assert_equal 4, @game.players[3].ranking
  end

  test 'ties are handled with class' do
    @game.players[3].update_attribute :score, @game.players[2].score
    assert_equal 1, @game.players[0].ranking
    assert_equal 2, @game.players[1].ranking
    assert_equal 3, @game.players[2].ranking
    assert_equal 3, @game.players[3].ranking
  end

  test 'ties are handled with class even in the middle' do
    @game.players[2].update_attribute :score, @game.players[1].score
    assert_equal 1, @game.players[0].ranking
    assert_equal 2, @game.players[1].ranking
    assert_equal 2, @game.players[2].ranking
    assert_equal 4, @game.players[3].ranking
  end

  test 'update ELO scores updates all players' do
    
  end
end
