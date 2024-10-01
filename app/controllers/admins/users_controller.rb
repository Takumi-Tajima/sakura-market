class Admins::UsersController < Admins::ApplicationController
  def index
    @users = User.default_order
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
