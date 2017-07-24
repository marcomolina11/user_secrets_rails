require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'relationships' do
	before do
      @user = User.create(name: "Marco", email: "marco@email.com", password: "password", password_confirmation: "password")
      @secret = @user.secrets.create(content: 'Oops')
      @like = Like.create(user: @user, secret: @secret)
    end
    it 'belongs to a user' do
      expect(@like.user).to eq(@user)
    end
    it 'belongs to a secret' do
      expect(@like.secret).to eq(@secret)
    end
  end
end
