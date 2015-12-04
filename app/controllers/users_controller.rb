class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :activate]

  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to users_path, notice: 'Success!'
  end

  def destroy
    @user.destroy
  end

  def activate
    if current_user.admin
      @user.activate_account!
      redirect_to users_path
    else
      redirect_to :back
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :approved)
    end
end
