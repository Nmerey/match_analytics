require 'rails_helper'

team = FactoryBot.create(:team)
team_with_players = FactoryBot.create_list(:player, 5, team_id: team.id)

RSpec.describe Team, type: :model do
  context "Team references" do
  	it "should have many players" do
  		expect(team.players.count).to eq(team_with_players.count)
  	end
  end
end
