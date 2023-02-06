# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teams = Team.create!([{name: "Spatrak"}, {name: "Zenit"}])

matchs = Match.create!([
  {title: "Match 1", team_1_id: teams[0].id, team_2_id: teams[1].id},
  {title: "Match 2", team_1_id: teams[0].id, team_2_id: teams[1].id},
  {title: "Match 3", team_1_id: teams[0].id, team_2_id: teams[1].id}
 ])

players = Player.create!([
  {name: "Maxim", team_id: teams[0].id},
  {name: "Vlad", team_id: teams[0].id},
  {name: "Artem", team_id: teams[0].id},
  {name: "Jon", team_id: teams[1].id},
  {name: "Den", team_id: teams[1].id},
  {name: "Leo", team_id: teams[1].id}
 ])

achievements = Achievement.create!([{title: "Run+10км"}, {title: "Pass>70%"}])

achievements_player = AchievementsPlayer.create!([
  {achievement_id: achievements[0].id, match_id: matchs[0].id, player_id: players[0].id },
  {achievement_id: achievements[0].id, match_id: matchs[1].id, player_id: players[0].id },
  {achievement_id: achievements[0].id, match_id: matchs[2].id, player_id: players[0].id },

  {achievement_id: achievements[1].id, match_id: matchs[0].id, player_id: players[1].id },

  {achievement_id: achievements[0].id, match_id: matchs[0].id, player_id: players[5].id },
  {achievement_id: achievements[0].id, match_id: matchs[1].id, player_id: players[5].id },
  {achievement_id: achievements[1].id, match_id: matchs[1].id, player_id: players[5].id }
 ])