class AddApiDetailUrlToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :api_detail_url, :string
  end
end
