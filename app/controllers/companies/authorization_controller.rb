module Companies
  class AuthorizationController < ApplicationController
    before_action :check_if_company

    def check_if_company
      company = Company.find_by(id: session[:user_id])
      redirect_to root_path unless company.exists?
    end
  end
end