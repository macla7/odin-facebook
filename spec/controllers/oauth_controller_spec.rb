# https://coderwall.com/p/t_3hmq/linkedin-oauth2-login-for-rails
# # Was trying to follow that ^ but was time 
# suck and seemed to be not working unless i did
# all his methods and serives i didn't understand..



# require 'rails_helper'
# 
# describe Users::OmniauthCallbacksController, type: :controller do
# 
#   before(:each) do
#     request.env['devise.mapping'] = Devise.mappings[:user] 
#     request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
#   end
# 
#   after(:each) do
#     OmniAuth.config.mock_auth[:facebook] = nil
#   end
# 
#   subject { user_facebook_omniauth_authorize_path }
# 
#   describe 'GET #callback' do
#     it 'expects omniauth.auth to be be_truthy' do
#       puts 'hi'
#       puts request.env['omniauth.auth']
#       expect(request.env['omniauth.auth']).to be_truthy
#     end
# 
#     it 'completes the registration process successfully' do
#       post :facebook
#       #expect(page).to redirect_to :action => :facebook
#     end
# 
#     it 'creates an oauth_account record' do
#       expect{
#         user_facebook_omniauth_authorize_path
#       }.to change { OauthAccount.count }.by(1)
#     end
# 
#   end
# 
# end