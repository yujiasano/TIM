class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_one :like

  validates :text, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
  def like_user(user_id)
    Like.find_by(user_id: user_id)
   end
end
