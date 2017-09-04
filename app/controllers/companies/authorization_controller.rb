module Companies
  class AuthorizationController < ApplicationController
    before_action :check_if_company

    def check_if_company
      if session[:user_id].present?
        company = Company.find_by(id: session[:user_id])
        redirect_to root_path unless company.present?
      else
        redirect_to root_path
      end
    end
  end
end