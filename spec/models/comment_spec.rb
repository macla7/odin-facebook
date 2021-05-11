require 'rails_helper'

RSpec.describe Comment, type: :model do
  let (:user) { User.create!(
    name: 'Anything',
    email: 'mitch@mitch',
    password: 'Bing111'
  )}
  let (:post) { user.posts.create!(
    content: 'Here I am, look at me!'
    )}
  subject { post.comments.create!(
    user: user,
    content: 'Big comment Boi.'
  )}

  it 'is valid with' do
    expect(subject).to be_valid
  end

  it 'has right user' do
    expect(subject.user_id).to eql(user.id)
  end

  it 'has right content' do
    expect(subject.content).to eql('Big comment Boi.')
  end

  it 'should have associated User' do
    expect(Comment.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  it 'should have associated Post' do
    expect(Comment.reflect_on_association(:post).macro).to eql(:belongs_to)
  end
end
