require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'has an ELO score' do
    assert_equal 1000, Factory(:user).elo_score
  end

end
