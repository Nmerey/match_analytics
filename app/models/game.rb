require 'byebug'

class Game < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  has_many :game_stats
  validates_presence_of :home_team, :away_team, :date

  def teams
  	@teams = Team.where(id: [self.home_team, self.away_team])
  end

  def players
  	@players = self.teams.map { |team| team.players }.flatten
  end
end
