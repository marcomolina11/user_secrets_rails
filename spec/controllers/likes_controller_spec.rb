require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = User.create(name: "Marco", email: "marco@email.com", password: "password", password_confirmation: "password")
    @secret = @user.secrets.create(content: 'test secret')
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil
   	end
   	it "cannot like a secret" do
   	  post :create, secret_id: @secret
   	  expect(response).to redirect_to('/sessions/new')
   	end
   	it "cannot unlike a secret" do
   	  delete :destroy, secret_id: @secret
   	  expect(response).to redirect_to('/sessions/new')
   	end
  end
  # describe "when signed in as the wrong user" do
  #   before do
  #     @wrong_user = create_user 'julius', 'julius@lakers.com'
  #     session[:user_id] = @wrong_user.id
  #   end
  #   it 'cannot destroy another users like' do

  #   end
  # end
end
