class AddHasStaffReviewToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :has_staff_review, :boolean
  end
end
