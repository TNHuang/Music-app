class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_name
      t.integer :track_id
      t.string :bonus_or_regular

      t.timestamps
    end

    add_index :tracks, :track_id, unique: true
  end
end
