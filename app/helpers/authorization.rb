module Authorization
  def log_in(account)
    session[:user_id] = account.id
    redirect_to companies_candidates_path if account.type == 'Company'
    redirect_to customers_candidates_path if account.type == 'Customer'
  end

  def logged_in?
    session[:user_id].present?
  end

  def valid_login?(account)
    account && account.authenticate(params[:session][:password])
  end

  def log_out
    session[:user_id] = nil
    redirect_to root_path
  end
end
