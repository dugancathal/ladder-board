class UsersController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def edit
    @user = current_user
    @email_hash = Digest::MD5.hexdigest(current_user.email)
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render 'edit', notice: 'Unable to update your stuff. Try again later'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :avatar)
  end
end
