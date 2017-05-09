class UsersController < ApplicationController
before_action :authorize_user, only: [:index, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @pictures = Picture.where(user_id: @user.id)
    @picture = Picture.new

  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
