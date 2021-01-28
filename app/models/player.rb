require "byebug"

class Player < ApplicationRecord
	belongs_to :team
	has_many :game_stats

	def check_stat(arg, valid_num, games = 5)
		valid_games = self.game_stats.last(games).map { |game_stat| game_stat.send(arg) > valid_num ? game_stat : nil  }
		valid_games.compact!

		if valid_games.empty?
			return "no such match"
		else
			valid_games
		end
	end

	def self.top_n_by(arg, n = 5)
		includes(:game_stats).reject { |player| player.game_stats.empty? }.sort_by { |player| player.game_stats.sum { |elem| elem.send(arg) } }.last(n).reverse!
	end
end