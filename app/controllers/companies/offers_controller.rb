module Companies
  class OffersController < Companies::AuthorizationController
    before_action :set_fascade, except: [:create, :new]
    before_action :authorize_user, except: [:index, :new, :create]
    before_action :redirect_if_company_properties_empty, only: [:create]

    def index; end

    def new
      @offer_form = OfferForm.new
    end

    def create
      @offer_form = OfferForm.new(offer_params)
      offer = @offer_form.create_new_offer(@current_user)

      if offer
        redirect_to companies_offer_path(offer)
      else
        flash.now[:alert] = @offer_form.errors.full_messages
        render :new
      end
    end

    def show; end

    private

    def offer_params
      params.require(:offer_form).permit(
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
      if @current_user != @offers_fascade.offer.company
        flash[:alert] = 'You are not allowed to see this content.'
        redirect_to companies_profile_path(@offers_fascade.offer.company)
      end
    end
  end
end