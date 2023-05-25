class AddDescriptionToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :description, :text
  end
end
