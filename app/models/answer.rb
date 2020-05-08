class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :like, optional: true

  validates :text, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
