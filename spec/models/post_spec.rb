require 'rails_helper'

RSpec.describe Post, type: :model do
  let (:user) { User.new(
    name: 'Anything',
    email: 'mitch@mitch',
    password: 'Bing111'
  )}
  subject { user.posts.new(
    content: 'Here I am, look at me!'
    )}

  it 'is valid with name' do
    expect(subject).to be_valid
  end

  it 'is not valid without content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it 'should have associated User' do
    expect(Post.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  it 'should have associated Likes' do
    expect(Post.reflect_on_association(:your_likes).macro).to eql(:has_many)
  end
  
  it 'should have associated Comments' do
    expect(Post.reflect_on_association(:comments).macro).to eql(:has_many)
  end

  it 'Should be able to find post content from user' do
    # IF I DELETE THESE PRINTS, then the expect 
    # doesn't work.. it's like it refreshes it
    # or something... Same for below..

    user.save!
    subject.save!
    expect(user.posts.first.content).to eql('Here I am, look at me!')
  end
end
