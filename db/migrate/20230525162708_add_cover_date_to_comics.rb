class AddCoverDateToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :cover_date, :date
  end
end
