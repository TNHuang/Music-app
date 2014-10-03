class ChangeAlbums < ActiveRecord::Migration
  def change
    rename_column :albums, :album_id, :band_id
  end
end
