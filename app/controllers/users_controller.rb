class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(account_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end

  private

  def account_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end