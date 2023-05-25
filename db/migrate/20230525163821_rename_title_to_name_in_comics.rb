class RenameTitleToNameInComics < ActiveRecord::Migration[6.0]
  def change
    rename_column :comics, :title, :name
  end
end
