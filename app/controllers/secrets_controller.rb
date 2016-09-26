class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def new
  end

  def create
    user = User.find(session[:user_id])
    secret = user.secrets.new(content:params[:content])
    if secret.valid?
      secret.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/users/#{user.id}", alert: secret.errors.full_messages
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    user = User.find(session[:user_id])
    Secret.find(params[:id]).destroy
    redirect_to "/users/#{user.id}"
  end
end
