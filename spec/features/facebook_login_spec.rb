require 'rails_helper'

RSpec.describe 'user login using social media', type: :feature do
  scenario "Facebook - signup" do
    visit root_path
    click_on 'Sign in with Facebook'
    expect(page).to have_content('Successfully authenticated from Facebook account')
  end
end