module Companies
  class OffersController < Companies::AuthorizationController
    before_action :set_offer, except: [:index, :new, :create]
    before_action :authorize_user, except: [:index, :new, :create]
    before_action :redirect_if_company_properties_empty, only: [:create]

    def index
      @offers = @current_user.offers
    end

    def new
      @offer = Offer.new
    end

    def create
      @offer = Offer.new(offer_params)
      @offer.company = @current_user

      if @offer.save
        redirect_to companies_offer_path(@offer.id)
      else
        flash.now[:alert] = @offer.errors.full_messages
        render :new
      end
    end

    def show
      @applicants = @offer.applicants.map(&:customer)
    end

    def edit; end

    def update; end

    def destroy
      
    end

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

    def set_offer
      @offer = Offer.find_by(id: params[:id])
    end

    def authorize_user
      redirect_to root_path if @current_user != @offer.company
    end
  end
end