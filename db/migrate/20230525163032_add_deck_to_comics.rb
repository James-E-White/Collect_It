class AddDeckToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :deck, :string
  end
end
