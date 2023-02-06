require 'rails_helper'

RSpec.describe Achievement, type: :model do
  it { should have_many(:achievements_players).dependent(:destroy) }

  it { should validate_presence_of :title }
end
