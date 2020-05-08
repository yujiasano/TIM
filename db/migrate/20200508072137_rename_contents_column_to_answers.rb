class RenameContentsColumnToAnswers < ActiveRecord::Migration[5.0]
  def change
    rename_column :answers, :contents, :text
  end
end
