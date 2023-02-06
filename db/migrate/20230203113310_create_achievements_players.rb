class CreateAchievementsPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :achievements_players do |t|

      t.references :achievement, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
