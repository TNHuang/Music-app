class ChangeBands < ActiveRecord::Migration
  def change
    rename_column :bands, :name, :band_name
  end
end
