class AddAliasesToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :aliases, :string
  end
end
