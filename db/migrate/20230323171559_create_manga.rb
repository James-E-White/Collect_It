class CreateManga < ActiveRecord::Migration[6.0]
  def change
    create_table :mangas do |t|
      t.string :title
      t.float :issue
      t.string :publisher
      t.references :user, null: false, foreign_key: true
    end
  end
end
