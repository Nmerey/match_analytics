require 'rails_helper'

player = FactoryBot.create(:player)
matchstat = FactoryBot.create(:match_stat)

RSpec.describe Player, type: :model do
  context "Player's Stats" do
  	it "should have distance covered" do
  		expect(player.distance_covered).to eq 35
  	end
  end
end
