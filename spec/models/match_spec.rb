require 'rails_helper'

f_team = FactoryBot.create(:team)
s_team = FactoryBot.create(:team)
certain_match = FactoryBot.create(:match, home_team: f_team, away_team: s_team)


RSpec.describe Match, type: :model do
  context "Match references" do
  	it "has 2 teams" do
  		expect(certain_match.teams.count).to eq 2
  	end

  	it "should be away_team and home_team" do
  		expect(certain_match.teams).to eq([s_team, f_team])
  	end

  	it "should have stats" do
  	end
  end
end
