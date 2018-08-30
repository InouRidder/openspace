class UsersController < ApplicationController
  before_action :set_user
  before_action :authorize_user

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :address, :country)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    authorize @user
  end
end
