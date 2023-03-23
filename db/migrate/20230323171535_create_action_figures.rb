class CreateActionFigures < ActiveRecord::Migration[6.0]
  def change
    create_table :action_figures do |t|
      t.string :figure
      t.string :brand
      t.references :user, null: false, foreign_key: true
    end
  end
end
