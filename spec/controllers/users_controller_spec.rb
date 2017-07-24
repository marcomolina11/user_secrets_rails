require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	before do
		@user = User.create(name: "Marco", email: "marco@email.com", password: "password", password_confirmation: "password")
	end
	describe "when not logged in" do
    	before do
      		session[:user_id] = nil
    	end
   		it "cannot access profile" do
      		get :profile, id: @user
      		expect(response).to redirect_to('/sessions/new')
    	end
    	it "cannot access edit" do
      		get :edit, id: @user
      		expect(response).to redirect_to('/sessions/new')
    	end
    	it "cannot access update" do
      		patch :update, id: @user
      		expect(response).to redirect_to('/sessions/new')
    	end
    	it "cannot access destroy" do
      		delete :destroy, id: @user
      		expect(response).to redirect_to('/sessions/new')
    	end
  end
  describe "when signed in as the wrong user" do
    before do
      @wrong_user = User.create(name: "lulius", email: "lulius@email.com", password: "password", password_confirmation: "password")
      session[:user_id] = @wrong_user.id
    end
    it "cannot access profile page another user" do
      get :edit, id: @user
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
    it "cannot update another user" do
      patch :update, id: @user
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
    it "cannot destroy another user" do
      delete :destroy, id: @user
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end
end
