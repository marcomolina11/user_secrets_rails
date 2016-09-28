class LikesController < ApplicationController
  def create
  	user = User.find(session[:user_id])
  	secret = Secret.find(params[:secret_id])
  	secret.likes.create(user:user)
  	redirect_to '/secrets'
  end

  def destroy
  end
end
