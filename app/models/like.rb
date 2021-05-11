class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :postee, class_name: 'User', foreign_key: 'postee_id'
end
