class Match < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  has_many :match_stats
  validates_presence_of :home_team, :away_team, :date

  def teams
  	@teams = [self.away_team, self.home_team]
  end
end
