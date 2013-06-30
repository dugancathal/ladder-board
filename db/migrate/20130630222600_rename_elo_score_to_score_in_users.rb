class RenameEloScoreToScoreInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :elo_score, :score
  end
end
