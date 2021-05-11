require 'rails_helper'

RSpec.describe Like, type: :model do
  let (:user) { User.create!(
    name: 'Anything',
    email: 'mitch@mitch',
    password: 'Bing111'
  )}
  let (:post) { user.posts.create!(
    content: 'Here I am, look at me!'
    )}
  subject { post.your_likes.create!(
    user: user,
    postee: user
  )}

  it 'is valid with postee' do
    expect(subject).to be_valid
  end

  it 'has right user' do
    expect(subject.user_id).to eql(user.id)
  end

  it 'has right postee' do
    expect(subject.postee_id).to eql(user.id)
  end

  it 'should have associated User' do
    expect(Like.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  it 'should have associated Postee' do
    expect(Like.reflect_on_association(:postee).macro).to eql(:belongs_to)
  end

  it 'should have associated Post' do
    expect(Like.reflect_on_association(:post).macro).to eql(:belongs_to)
  end
end
