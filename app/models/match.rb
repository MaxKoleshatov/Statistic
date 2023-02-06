class Match < ApplicationRecord
  has_many :achievements_players, dependent: :destroy
  
  validates :title, presence: true
  validates :team_1_id, presence: true
  validates :team_2_id, presence: true
end
