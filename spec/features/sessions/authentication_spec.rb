require 'rails_helper'
feature 'authentication' do
  before do
    @user = User.create(name: 'Marco', email: 'marco@email.com', password: 'password', password_confirmation: 'password')
  end
  feature "user sign-in" do
    scenario 'visits sign-in page' do
      visit '/sessions/new'
      expect(page).to have_field('email')
      expect(page).to have_field('password')
    end
  end
end
