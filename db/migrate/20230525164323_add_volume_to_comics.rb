class AddVolumeToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :volume, :string
  end
end
