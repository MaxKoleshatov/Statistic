require 'rails_helper'

RSpec.describe AchievementsPlayer, type: :model do
  it { should belong_to :match}
  it { should belong_to :player}
  it { should belong_to :achievement}

  it { should validate_presence_of :achievement_id }
  it { should validate_presence_of :match_id }
  it { should validate_presence_of :player_id }
end
