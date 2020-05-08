class RemoveNameFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :name, :string
  end
end
