class UsersController < ApplicationController
  def index
  end

  def profile
    @user = User.find(session[:user_id])
  end

  def login
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect_to "/users/#{user.id}"
    else
      redirect_to "/sessions/new", :alert => "Invalid email/password"
    end
  end

  def logout
    session.clear
    redirect_to '/sessions/new'
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # private

end
