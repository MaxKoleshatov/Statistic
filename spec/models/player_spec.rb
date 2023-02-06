require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should have_many(:achievements_players).dependent(:destroy) }
  it { should have_many(:achievements).through(:achievements_players).dependent(:destroy) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :team_id }


  describe 'player methods' do
    let!(:achievement) { create(:achievement) }

    let!(:achievements_player_1) { create(:achievements_player, achievement_id: achievement.id, player_id: player_best.id, match_id: match_1.id)}
    let!(:achievements_player_2) { create(:achievements_player, achievement_id: achievement.id, player_id: player_best.id, match_id: match_2.id)}
    let!(:achievements_player_3) { create(:achievements_player, achievement_id: achievement.id, player_id: player_2.id, match_id: match_2.id)}
    let!(:achievements_player_4) { create(:achievements_player, achievement_id: achievement.id, player_id: player_3.id, match_id: match_8.id)}

    let!(:team_1) { create(:team) }
    let!(:team_2) { create(:team) }
    let!(:team_3) { create(:team) }
    let!(:team_4) { create(:team) }

    let!(:match_1) { create(:match, team_1_id: team_1.id, team_2_id: team_2.id) }
    let!(:match_2) { create(:match, team_1_id: team_1.id, team_2_id: team_2.id) }
    let!(:match_3) { create(:match, team_1_id: team_1.id, team_2_id: team_2.id) }
    let!(:match_4) { create(:match, team_1_id: team_1.id, team_2_id: team_2.id) }
    let!(:match_5) { create(:match, team_1_id: team_1.id, team_2_id: team_2.id) }
    let!(:match_6) { create(:match, team_1_id: team_1.id, team_2_id: team_2.id) }
    let!(:match_7) { create(:match, team_1_id: team_3.id, team_2_id: team_4.id) }
    let!(:match_8) { create(:match, team_1_id: team_3.id, team_2_id: team_4.id) }

    let!(:player_best) { create(:player, name: "Max", team_id: team_1.id) }
    let!(:player_2) { create(:player, name: "Alex", team_id: team_1.id) }
    let!(:player_3) { create(:player, name: "Jon", team_id: team_3.id) }
    

    it 'you can assign achievements' do
      expect{player_2.up_achievement(match_3, achievement)}.to change{AchievementsPlayer.count}.by(1)
    end

     #Проверяются только те последние матчи, в которых играла команда игрока
    it 'you can check best player in 5 matches' do
      expect(player_best.check_achievement_5_matches(achievement)).to eq true
    end
    
    it 'you can check best player all teams' do
      expect(Player.best_player_all(achievement).first).to eq player_best
    end
    it 'you can check best player 1 team' do
      expect(Player.best_player_team(achievement, player_best.team).first).to eq player_best
    end
  end
end
