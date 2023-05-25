class AddAssociatedImagesToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :associated_images, :text
  end
end
