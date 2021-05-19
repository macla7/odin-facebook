class Post < ApplicationRecord
  belongs_to :user
  has_many :your_likes, class_name: 'Like', dependent: :destroy
  has_many :comments
  has_one_attached :photo, dependent: :destroy

  validates :content, presence: true
end
