class Post < ApplicationRecord
  belongs_to :user
  has_many :your_likes, class_name: 'Like', dependent: :destroy
end
