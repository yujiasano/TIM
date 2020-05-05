class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :contents
      t.string :image
      t.timestamps
    end
  end
end
