require 'rails_helper'

RSpec.describe Request, type: :model do

  let(:user1) { User.new(
    name: 'Anything',
    email: 'mitch@mitch',
    password: 'Bing111'
    )}
  let(:user2) { User.new(
    name: 'Something',
    email: 'lich@lich',
    password: 'Bing111'
    )}
  subject { described_class.new(
    user_id: user1.id,
    friend_id: user2.id,
    confirmed: true
  )}

  it 'is valid with user, friend and confirmed' do
    user1.save!
    user2.save!
    expect(subject).to be_valid
  end

  it 'is not valid without user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without friend' do
    subject.friend_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without confirmed' do
    subject.confirmed = nil
    expect(subject).to_not be_valid
  end

  it 'should have associated user' do
    expect(Request.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  it 'return true if request accepted' do
    user1.save!
    user2.save!
    subject.save!
    expect(Request.confirmed_request?(user1.id, user2.id)).to eql true
  end

  it 'be true if request pending, or friend already' do
    user1.save!
    user2.save!
    subject.save!
    expect(Request.record?(user1.id, user2.id)). to eql true
  end

  it 'should return the existing friendship id' do
    user1.save!
    user2.save!
    subject.save!
    expect(Request.find_friend_record(user1.id, user2.id)).to eql subject.id
  end
end