class Admins::UsersController < Admins::ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  def index
    @users = User.default_order
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admins_users_path, notice: '更新に成功しました', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    redirect_to admins_users_path, notice: 'ユーザーを削除しました', status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
