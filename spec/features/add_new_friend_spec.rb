require 'rails_helper'

RSpec.describe 'add friend', type: :feature do
  subject { described_class.new(
    name: 'Mitchel Clark',
    email: 'mitch@mitch',
    password: 'Bing111'
    )}

  scenario "send another user a friend request" do
    visit root_path
    fill_in 'Email', with: 'Clark@bing'
    fill_in 'Password', with: 'Bing111'
    click_on 'Log in'
    click_on 'Nark'
    click_on 'Add Friend'

    mc = User.find_by(name: 'Clark').id
    nc = User.find_by(name: 'Nark').id
    expect(Request.record?(mc, nc)).to eql true
  end
end