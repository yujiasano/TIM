class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :likes
  has_many :answers
  has_many :card
  def already_liked?(answer)
    self.likes.exists?(answer_id: answer.id)
  end
end
