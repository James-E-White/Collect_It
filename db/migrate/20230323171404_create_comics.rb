class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.json "image"
      t.float :issue
      t.string :publisher
      t.references :user, null: false, foreign_key: true
    end
  end
end
