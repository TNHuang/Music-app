class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
       t.string :band_name
       t.integer :band_id

       t.timestamps
    end

    add_index :bands, :band_id, unique: true
  end
end
