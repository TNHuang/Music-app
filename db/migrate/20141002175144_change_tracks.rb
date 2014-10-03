class ChangeTracks < ActiveRecord::Migration
  def change
    rename_column :tracks, :track_id, :album_id
  end
end
