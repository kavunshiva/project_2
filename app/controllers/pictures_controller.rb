class PicturesController < ApplicationController

  def new
    @picture = Picture.new(picture_params)
  end

  def show
      @user = User.find(params[:user_id])
      @picture = Picture.find(params[:id])
      @comment = Comment.new
      @comments = @picture.comments
  end

  def create
    @picture = Picture.create(picture_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(current_user)
  end


  private

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id)
  end


end
