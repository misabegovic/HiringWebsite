module Customers
  class AuthorizationController < ApplicationController
    before_action :check_if_customer

    def check_if_customer
      customer = Customer.find_by(id: session[:user_id])
      redirect_to root_path unless customer.exists?
    end
  end
end