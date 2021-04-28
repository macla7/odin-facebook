class User < ApplicationRecord
  has_many :requests
  has_many :pending_requests, -> { where confirmed: false }, class_name: 'Request', foreign_key: 'friend_id'
  has_many :sent_requests, -> { where confirmed: false }, class_name: 'Request', foreign_key: 'user_id'
  
  validates :name, presence: true

  def friends
    friends_i_sent_requests = Request.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_requests = Request.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_got_requests + friends_i_sent_requests
    User.where(id: ids)
  end

  def friends_with?(user)
    Request.confirmed_request?(id, user.id)
  end

  def send_request(user)
    requests.create(friend_id: user.id)
  end
end
