module Customers
  class ProfilesController < Customers::AuthorizationController
    before_action :set_profile

    def show; end

    def edit; end

    def update; end

    private

    def set_profile
      @profile = Customer.find(params[:id])
    end
  end
end