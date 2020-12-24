class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.datetime :date
      t.references :home_team
      t.references :away_team

      t.timestamps
    end
  end
end
