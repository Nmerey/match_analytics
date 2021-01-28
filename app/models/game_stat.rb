class GameStat < ApplicationRecord
  belongs_to :game
  belongs_to :player

  def shots
  	@shots = self.shot_misses + self.shot_on_target
  end

  def shot_acc(decimal = 2)
  	@shot_acc = self.shot_on_target * 100.00 / self.shots
  	@shot_acc.round(decimal)
  end

  def pass_acc(decimal = 2)
  	@pass_acc  = self.pass_completed * 100.00 / self.passes
  	@pass_acc.round(decimal)
  end

  def self.passes(game = Game.last)
  	game_stats = GameStat.where(game: game)
  	@passes = game_stats.sum(:passes)
  end

  def self.shots(game = Game.last)
  	game_stats = GameStat.where(game: game)
  	@shots = game_stats.sum(:shots)
  end

end
