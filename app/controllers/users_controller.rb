class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :activate]
  before_action :authenticate_user!
  before_action :admin_user, only: [:edit, :update, :destroy, :activate]

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
    if @user.update(user_params)
      redirect_to users_path, notice: 'Success!'
    end
  end

  def destroy
    @user.destroy
  end

  def activate
    @user.activate_account!
    redirect_to users_path
  end

  private

    def admin_user
      redirect_to :back, alert: "Insufficient rights!" unless current_user.admin?
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :status)
    end
end
