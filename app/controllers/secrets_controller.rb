class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @user = User.find(session[:user_id])
    @secrets = Secret.all
    @secrets_liked = User.find(session[:user_id]).secrets_liked.select('id')

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
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to "/users/#{user.id}"
  end
end
