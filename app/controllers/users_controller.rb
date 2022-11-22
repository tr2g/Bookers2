class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def update
    user = User.find(params[:id])
  if user.update(user_params)
    flash[:notice] = "User Information update successfully!"
    redirect_to users_path
  else
    render :edit
  end
  end

 def edit
    @user = User.find(params[:id])
 end

 def index
    @users = User.all
    @user = current_user
    @book = Book.new
 end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(users_path) unless @user == current_user
  end


end
