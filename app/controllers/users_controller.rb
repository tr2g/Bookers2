class UsesController < ApplicationController
  def show
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to users_path
  end

 def edit
    @user = User.find(params[:id])
 end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
