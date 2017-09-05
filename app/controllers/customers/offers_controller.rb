module Customers
  class OffersController < Customers::AuthorizationController
    before_action :set_offer, except: [:index]

    def index
      @offers = Offer.all
    end

    def show
      @already_applied = Applicant.find_by(offer: @offer, customer: @current_user)
    end

    def update
      Applicant.create(offer: @offer, customer: @current_user)
      flash.now[:success] = 'You applied successfully'
      redirect_to cutomers_offer_path(@offer)
    end

    private

    def set_offer
      @offer = Offer.find_by(id: params[:id])
    end
  end
end