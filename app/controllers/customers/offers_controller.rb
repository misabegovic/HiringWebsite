module Customers
  class OffersController < Customers::AuthorizationController
    before_action :set_offer, except: [:index]

    def index
      @offers = Offer.all
    end

    def show; end

    def update
      @offer.customers << @current_user
      render :show, id: @offer
    end

    private

    def set_offer
      @offer = Offer.find_by(id: params[:id])
    end
  end
end