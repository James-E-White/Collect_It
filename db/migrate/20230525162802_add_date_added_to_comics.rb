class AddDateAddedToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :date_added, :datetime
  end
end
