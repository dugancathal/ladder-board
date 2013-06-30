class AddEloScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :elo_score, :integer, default: 1000
  end
end
