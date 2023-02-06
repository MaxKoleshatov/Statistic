require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_many(:achievements_players).dependent(:destroy) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :team_1_id }
  it { should validate_presence_of :team_2_id }
end
