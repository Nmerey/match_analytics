class CreateMatchStats < ActiveRecord::Migration[6.1]
  def change
    create_table :match_stats do |t|
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :shot_on_target
      t.integer :shot_misses
      t.integer :distance_covered
      t.integer :passes
      t.integer :pass_acc

      t.timestamps
    end
  end
end
