class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.integer :album_id
      t.string :live_or_studio

      t.timestamps
    end

    add_index :albums, :album_id, unique: true
  end
end
