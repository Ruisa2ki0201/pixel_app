class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @posts = current_user.posts
    @likes = current_user.likes
    @comments = current_user.comments
  end

  def edit
    user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image, :password,:password_confirmation)
  end
end
