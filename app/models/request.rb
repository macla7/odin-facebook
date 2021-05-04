class Request < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :friend_id, presence: true
  validates :confirmed, exclusion: [nil]

  def self.confirmed_request?(id1, id2)
    case1 = !Request.where(user_id: id1, friend_id: id2, confirmed: true).empty?
    case2 = !Request.where(user_id: id2, friend_id: id1, confirmed: true).empty?
    case1 || case2
  end

  def self.record?(id1, id2)
    case1 = !Request.where(user_id: id1, friend_id: id2).empty?
    case2 = !Request.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end

  def self.got_request?(id1, id2)
    case1 = !Request.where(user_id: id1, friend_id: id2, confirmed: false).empty?
    case1
  end

  def self.got_any_requests?(id1)
    Request.where(friend_id: id1, confirmed: false)
  end

  def self.find_friend_record(id1, id2)
    if Request.where(user_id: id1, friend_id: id2, confirmed: true).empty?
      Request.where(user_id: id2, friend_id: id1, confirmed: true)[0].id
    else
      Request.where(user_id: id1, friend_id: id2, confirmed: true)[0].id
    end
  end
end
