require 'rails_helper'

RSpec.describe 'User request', type: :feature do

  let(:user1) {User.find_by(name: 'Clark')}
  let(:user2) {User.find_by(name: 'Nark')}


  scenario "send to another user" do
    visit root_path
    fill_in 'Email', with: 'Clark@bing'
    fill_in 'Password', with: 'Bing111'
    click_on 'Log in'
    click_on 'Nark'
    click_on 'Add Friend'

    expect(Request.record?(user1.id, user2.id)).to eql true
  end

  scenario 'acccepting request' do
    Request.create(
      user_id: user1.id,
      friend_id: user2.id,
      confirmed: false )
    visit root_path
    fill_in 'Email', with: 'Nark@bing'
    fill_in 'Password', with: 'Bing111'
    click_on 'Log in'
    click_on 'Clark'
    click_on 'Accept Friend Request'

    expect(Request.confirmed_request?(user1.id, user2.id))
    expect(page).to have_content('friends')
  end
    
end