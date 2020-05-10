class AddLikeIdToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :like, foreign_key: true
  end
end
