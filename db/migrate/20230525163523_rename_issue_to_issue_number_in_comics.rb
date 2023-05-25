class RenameIssueToIssueNumberInComics < ActiveRecord::Migration[6.0]
  def change
    rename_column :comics, :issue, :issue_number
  end
end
