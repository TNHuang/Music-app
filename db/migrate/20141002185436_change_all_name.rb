class ChangeAllName < ActiveRecord::Migration
  def change
    rename_column :bands, :band_name, :name
    rename_column :albums, :album_name, :name
    rename_column :tracks, :track_name, :name
  end
end
