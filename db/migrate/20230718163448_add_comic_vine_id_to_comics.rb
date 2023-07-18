class AddComicVineIdToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :comic_vine_id, :string
    add_index :comics, :comic_vine_id
  end
end
