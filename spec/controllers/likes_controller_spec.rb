require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = create_user
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
end
