class SessionsController < ApplicationController
  before_action :redirect_to_root, only: [:new, :create]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if valid_login?(user)
      log_in(user)
    else
      flash.now[:alert] = 'Wrong Email/Password Combination'
      render :new
    end
  end

  def destroy
    log_out
  end

  private

  def redirect_to_root
    redirect_to root_path if logged_in?
  end
end