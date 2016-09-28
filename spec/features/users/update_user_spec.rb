require 'rails_helper'
RSpec.describe 'updating user' do
  it 'updates user and redirects to profile page' do
    user = create_user
    log_in user
    expect(page).to have_text('Marco')
    click_link 'Edit Profile'
    fill_in 'name', with: 'Drake'
    click_button 'Update'
    expect(page).not_to have_text('Marco')
    expect(page).to have_text('Drake')
  end
  it 'Ensures name cannot be blank and redirects to profile page' do
    user = create_user
    log_in user
    expect(page).to have_text('Marco')
    click_link 'Edit Profile'
    fill_in 'name', with: ''
    click_button 'Update'
    expect(page).to have_text("can't be blank")
  end
end