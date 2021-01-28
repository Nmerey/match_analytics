require 'rails_helper'
require "byebug"

player 					= FactoryBot.build(:player)
player2 				= FactoryBot.build(:player)
player3 				= FactoryBot.build(:player)
team 					= FactoryBot.build(:team)
a_team 					= FactoryBot.build(:team)
game 					= FactoryBot.build(:game, home_team: team, away_team: a_team)
game_stat 				= FactoryBot.build(:game_stat, player: player, game: game)
game_stat2 				= FactoryBot.build(:game_stat, player: player2, game: game)
game_stat3 				= FactoryBot.build(:game_stat, player: player3, game: game)

game_stat.shot_on_target 	= 1000006
game_stat2.shot_on_target 	= 1000005
game_stat3.shot_on_target 	= 1000004
game_stat.save
game_stat2.save
game_stat3.save
player.team 				= team

RSpec.describe Player, type: :model do
	context "references" do
		it "should belong to team" do	
			expect(player.team).to eq(team)
		end
	end

	context "stat methods" do
		it "should check for passes in last  5 matches" do
			expect(player.check_stat("passes", 50)).to eq true
		end

		it "should check for shots in last 10 matches" do
			expect(player.check_stat("shots", 5, 10)).to eq true
		end

		it	"should check top 3 players by shot on target" do
			expect(Player.top_n_by("shot_on_target", 3)).to eq [player, player2, player3]
			game_stat.shot_on_target 	= 10
			game_stat2.shot_on_target 	= 10
			game_stat3.shot_on_target 	= 10
			game_stat.save
			game_stat2.save
			game_stat3.save
		end
	end
end
