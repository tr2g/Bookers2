class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_path
  end

 def edit
    @user = User.find(params[:id])
 end

 def index
    @users = User.all
    @user = current_user
 end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
