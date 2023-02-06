class Player < ApplicationRecord
  belongs_to :team

  has_many :achievements_players, dependent: :destroy
  has_many :achievements, through: :achievements_players, dependent: :destroy

  validates :name, presence: true
  validates :team_id, presence: true

  def up_achievement(match, achievement)
    AchievementsPlayer.create(achievement_id: achievement.id, match_id: match.id, player_id: self.id)
  end

  def check_achievement_5_matches(achievement)
    check = self.achievements_players
    .where(achievement_id: achievement.id, match_id: Match.where(team_1_id: self.team)
    .or(Match.where(team_2_id: self.team)).reverse[0..4])

    return true unless check.empty?
    return false if check.empty?
  end

  def self.best_player_all(achievement)
    self.joins(:achievements_players)
    .where(achievements_players: {achievement_id: achievement.id})
    .tally.sort_by {|_key, value| value}
    .flatten.reverse.reject { |el| el.class == Integer }[0..4]
  end

  def self.best_player_team(achievement, team)
    self.joins(:achievements_players)
    .where(achievements_players: {achievement_id: achievement.id}).where(team_id: team.id)
    .tally.sort_by {|_key, value| value}
    .flatten.reverse.reject { |el| el.class == Integer }[0..4]
  end
end