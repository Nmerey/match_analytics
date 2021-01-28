# README

* Ruby version

ruby-2.7.2
rails-6.1.0

* Configuration

`bundle install`

* Database creation

`rake db:create & rake db:migrate`
`rake db:seed`

* How to run the test suite

`bundle exec rspec`

* Usage

Models:
	Player, Team, Game, GameStat
Methods:
	Player:
		`check_stat(arg, valid_num, games = 5)` method that is used to check if player have completed certain `valid_num` of `arg` stat in `games` games.
			arguments:
				arg: argument for attribute of any `GameStat` instance.
				valid_num: number that attribute's stat is checked against.
				games: default is 5. Number of last `GameStat` instances looked into.
		# Example
			# player = Player.create(..)
			# player.check_stat("shot_acc", 50)
			# if there is instance of `GameStat` where shot_acc is >= 50% it will return them in last 5 games
			# if not then `no such match`
		`self.top_n_by(arg, n = 5)` class method that to find top n players by their `arg` attribute
			arguments:
				arg: argument for attribute of any `GameStat` instance.
				n: default is 5. Number of top players returned
		# Example
			# Player.top_n_by("shot_on_target",3)
			# => [player_with_top_stat1, player_with_top_stat2, player_with_top_stat3]
	GameStats:
		class GameStat < ApplicationRecord
		  belongs_to :game
		  belongs_to :player

		  def shots
		  #method that gets all shots made by player that game
		  	@shots = self.shot_misses + self.shot_on_target
		  end

		  def shot_acc(decimal = 2)
		  #percentage of shots on target according to all shots
		  #decimal is arg given when more presize result wanted default is 2
		  	@shot_acc = self.shot_on_target * 100.00 / self.shots
		  	@shot_acc.round(decimal)
		  end

		  def pass_acc(decimal = 2)
		  #percentage of passes completed according to all passes
		  	@pass_acc  = self.pass_completed * 100.00 / self.passes
		  	@pass_acc.round(decimal)
		  end

		  def self.passes(game = Game.last)
		  	#class method that gets number of all passes made at certain game default is last game.
		  	game_stats = GameStat.where(game: game)
		  	@passes = game_stats.sum(:passes)
		  end

		  def self.shots(game = Game.last)
		  	#class method of all shots at certain game default is last game.
		  	game_stats = GameStat.where(game: game)
		  	@shots = game_stats.sum(:shots)
		  end
		 end
	Game:
		class Game < ApplicationRecord
		  belongs_to :home_team, class_name: "Team"
		  belongs_to :away_team, class_name: "Team"
		  has_many :game_stats
		  validates_presence_of :home_team, :away_team, :date

		  def teams
		  #methods that gets all teams in a match
		  	@teams = Team.where(id: [self.home_team, self.away_team])
		  end

		  def players
		  #method that gets all players who have played at certain game
		  	@players = self.teams.map { |team| team.players }.flatten
		  end
		end
	

