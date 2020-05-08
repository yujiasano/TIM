class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :name
      t.text :contents
      t.string :image
      t.references :user, foreign_key: true
      t.timestamps

    end
  end
end
