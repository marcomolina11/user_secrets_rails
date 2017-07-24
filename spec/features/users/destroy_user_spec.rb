require 'rails_helper'
RSpec.describe 'deleting account' do
  it 'destroys user and redirects to login page' do
    user = User.create(name: "Marco", email: "marco@email.com", password: "password", password_confirmation: "password")
    visit '/sessions/new' unless current_path == "/sessions/new"
    fill_in 'email', with: "marco@email.com"
    fill_in 'password', with: "password"
    click_button 'Log in'
    click_link 'Edit Profile'
    click_button 'Delete Account'
    expect(current_path).to eq('/sessions/new')
  end
end
