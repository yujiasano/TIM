class Question < ApplicationRecord

  has_many :answers
  belongs_to :user
  
  validates :contents, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
  def self.search(search)
    return Question.all unless search
    Question.where('contents LIKE(?)', "%#{search}%")
  end
end
