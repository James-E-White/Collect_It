class AddDateLastUpdatedToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :date_last_updated, :datetime
  end
end
