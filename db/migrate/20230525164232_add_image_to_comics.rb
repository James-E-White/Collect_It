class AddImageToComics < ActiveRecord::Migration[6.0]
  def up
    add_column :comics, :image, :string unless column_exists?(:comics, :image)
  end

  def down
    remove_column :comics, :image, :string if column_exists?(:comics, :image)
  end
end
