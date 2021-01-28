require 'rails_helper'
require 'byebug'

h_team = FactoryBot.create(:team)
a_team = FactoryBot.create(:team)
player = FactoryBot.create(:player, team_id: h_team.id)
player2 = FactoryBot.create(:player, team_id: a_team.id)
game = FactoryBot.create(:game,away_team_id: a_team.id, home_team_id: h_team.id)
game_stat = FactoryBot.create(:game_stat, game_id: game.id, player_id: player.id)
player2_game_stat = FactoryBot.create(:game_stat, game_id: game.id, player_id: player2.id)
game_stat.shot_on_target = 10
game_stat.shot_misses = 12
game_stat.passes = 100
game_stat.pass_completed = 60
player2_game_stat.passes = 99
game_stat.save()
player2_game_stat.save()

RSpec.describe GameStat, type: :model do
	context "instance of gameStat references" do
		it "should belong to game" do
			expect(game_stat.game).to eq(game)
		end	

		it "should belong to player" do
			expect(game_stat.player).to eq(player)
		end
	end

	context "instance of player's GameStat attrs" do
		
		it " should have all shots count " do
			expect(game_stat.shots).to eq(22)
		end

		it "should have shot accurracy" do
			expect(game_stat.shot_acc(4)).to eq(45.4545)
		end

		it "should have pass accurracy" do
			expect(game_stat.pass_acc).to eq(60.00)
		end
	end

	context "General statistics of certain game" do

		it "should have all passes" do
			expect(GameStat.passes(game)).to eq(game_stat.passes + player2_game_stat.passes) 
		end
	end
end
