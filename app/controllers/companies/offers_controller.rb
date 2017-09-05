module Companies
  class OffersController < Companies::AuthorizationController
    before_action :set_offer, except: [:index]
    before_action :authorize_user, except: [:index]

    def index
      @offers = @current_user.offers
    end

    def show; end

    def edit; end

    def update; end

    private

    def set_offer
      @offer = Offer.find_by(id: params[:id])
    end

    def authorize_user
      redirect_to root_path if @current_user != @offer.company
    end
  end
end