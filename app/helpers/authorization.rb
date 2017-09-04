module Authorization
  def log_in(account)
    session[:user_id] = account.id
    redirect_to root_path
  end

  def logged_in?
    session[:user_id].present?
  end

  def valid_login?(account)
    account && account.authenticate(params[:session][:password])
  end

  def log_out
    session[:user_id] = nil
    @current_account = nil
    redirect_to root_path
  end

  def current_account
    @current_account ||= User.find_by(id: session[:user_id])
  end

  def authorize
    redirect_to new_session_path unless current_account
  end
end
