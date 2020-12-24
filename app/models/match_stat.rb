class MatchStat < ApplicationRecord
  belongs_to :match
  belongs_to :player

  def shots
  	@shots = self.misses + self.shots_on_target
  end

  def shot_acc
  	@shot_acc = self.misses * 100 / self.shots
  end
end
