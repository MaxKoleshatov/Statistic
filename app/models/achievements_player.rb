class AchievementsPlayer < ApplicationRecord
  belongs_to :match
  belongs_to :player
  belongs_to :achievement

  validates :achievement_id, presence: true
  validates :match_id, presence: true
  validates :player_id, presence: true
end
