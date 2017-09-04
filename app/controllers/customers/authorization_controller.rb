module Customers
  class AuthorizationController < ApplicationController
    before_action :check_if_customer

    def check_if_customer
      if session[:user_id].present?
        customer = Customer.find_by(id: session[:user_id])
        redirect_to new_session_path unless customer.present?
      else
        redirect_to new_session_path
      end
    end
  end
end