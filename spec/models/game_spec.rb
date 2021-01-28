require 'rails_helper'

f_team = FactoryBot.create(:team)
s_team = FactoryBot.create(:team)
certain_game = FactoryBot.create(:game, home_team: f_team, away_team: s_team)


RSpec.describe Game, type: :model do
  context "references" do
  	it "has 2 teams" do
  		expect(certain_game.teams.count).to eq 2
  	end

  	it "should be away_team and home_team" do
  		expect(certain_game.teams).to include(s_team, f_team)
  	end
  end
end
