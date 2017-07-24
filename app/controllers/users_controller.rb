class UsersController < ApplicationController
  before_action :require_login, except: [:index, :create, :login, :new]
  before_action :require_correct_user, only: [:profile, :edit, :update, :destroy]
  def index
  end

  def profile
    @user = User.find(params[:id])
    @secrets = @user.secrets
    @secrets_liked = User.find(session[:user_id]).secrets_liked
  end

  def login
    user = User.find_by_email(params[:email])
     if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
     else
        redirect_to "/sessions/new", :alert => "Invalid email/password"
     end


  end

  def logout
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

  def new
  end

  def create
    user = User.new(name:params[:name], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/", alert: user.errors.full_messages
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(name:params[:name], email:params[:email])
       redirect_to "/users/#{@user.id}"
    else
       flash[:alert] = @user.errors.full_messages
       redirect_to controller: 'users', action: 'edit', id: params[:id]
    end

  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

  # private

end
