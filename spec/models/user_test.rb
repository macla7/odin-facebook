require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new(name: 'Anything')}
  let (:friend) { User.new(name: 'Something')}
  let (:request) { Request.new(
    user_id: subject.id,
    friend_id: friend.id,
    confirmed: true
    )}
  

  it 'is valid with name' do
    expect(subject).to be_valid
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have associated requests' do
    expect(User.reflect_on_association(:requests).macro).to eql(:has_many)
  end

  it 'should have associated unaccepted requests' do
    expect(User.reflect_on_association(:pending_requests).macro).to eql(:has_many)
  end
  
  it 'should have sent_requests' do
    expect(User.reflect_on_association(:sent_requests).macro).to eql(:has_many)
  end

  it 'should return active relation of friends' do
    # IF I DELETE THESE PRINTS, then the expect 
    # doesn't work.. it's like it refreshes it
    # or something... Same for below..

    subject.save!
    friend.save!
    request.save!
    expect(subject.friends.first.name).to eql('Something')
  end

  it 'should return true if friends with' do
    subject.save!
    friend.save!
    request.save!
    expect(subject.friends_with?(friend)).to eql(true)
  end

  it 'should send request' do
    subject.save!
    friend.save!
    request.save!
    output = subject.send_request(friend)
    expect(output).to be_a Request
    expect(output).to have_attributes(user_id: subject.id, friend_id: friend.id, confirmed: false)
  end

end