class AddImageToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :image, :string
  end
end
