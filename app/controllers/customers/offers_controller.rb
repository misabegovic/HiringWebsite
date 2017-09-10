module Customers
  class OffersController < Customers::AuthorizationController
    before_action :set_fascade
    before_action :redirect_if_customer_properties_empty, only: [:update]

    def index
      @offers_fascade.search(params[:search]) if params[:search]
    end

    def show; end

    def update
      @offers_fascade.update
      flash[:success] = 'You applied successfully'
      redirect_to customers_offer_path(@offers_fascade.offer)
    end

    private

    def set_fascade
      @offers_fascade = OffersFascade.new(params, @current_user)
    end

    def redirect_if_customer_properties_empty
      if @current_user.properties.empty?
        flash[:alert] = 'Before applying for a job, you need to update your account with neccessary data.'
        redirect_to customers_offer_path(@offers_fascade.offer)
      end
    end
  end
end