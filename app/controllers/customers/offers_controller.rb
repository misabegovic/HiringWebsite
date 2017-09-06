module Customers
  class OffersController < Customers::AuthorizationController
    before_action :set_offer, except: [:index]
    before_action :redirect_if_customer_properties_empty, only: [:update]

    def index
      @offers = Offer.all
    end

    def show
      @already_applied = Applicant.find_by(offer: @offer, customer: @current_user)
    end

    def update
      Applicant.create(offer: @offer, customer: @current_user)
      flash[:success] = 'You applied successfully'
      redirect_to customers_offer_path(@offer)
    end

    private

    def set_offer
      @offer = Offer.find_by(id: params[:id])
    end

    def redirect_if_customer_properties_empty
      if @current_user.properties.empty?
        flash[:alert] = 'Before applying for a job, you need to update your account with neccessary data.'
        redirect_to customers_offer_path(@offer)
      end
    end
  end
end