module Companies
  class OffersController < Companies::AuthorizationController
    before_action :set_fascade
    before_action :authorize_user, except: [:index, :new, :create]
    before_action :redirect_if_company_properties_empty, only: [:create]

    def index; end

    def new; end

    def create
      if @offers_fascade.save(offer_params)
        redirect_to companies_offer_path(@offers_fascade.offer.id)
      else
        flash.now[:alert] = @offers_fascade.errors
        render :new
      end
    end

    def show; end

    private

    def offer_params
      params.require(:offer).permit(
        :position,
        :salary,
        :type_of_contract
      )
    end

    def redirect_if_company_properties_empty
      if @current_user.properties.empty?
        flash.now[:alert] = 'Before creating a job offer, you need to update your account with neccessary data.'
        render :new
      end
    end

    def set_fascade
      @offers_fascade = OffersFascade.new(params, @current_user)
    end

    def authorize_user
      redirect_to root_path if @current_user != @offers_fascade.offer.company
    end
  end
end