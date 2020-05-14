class AddColumnToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :price, :string
  end
end
