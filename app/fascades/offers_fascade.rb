class OffersFascade
  attr_accessor :offer, :offers

  def initialize(params, current_user = nil)
    @offer = Offer.find_by(id: params[:id]) if params[:id]
    @current_user = current_user if current_user
  end

  def search(params)
    if params[:position]
      @offers = get_all_offers.where("position LIKE ?", "%#{params[:position]}%")
    elsif params[:salary]
      @offers = get_all_offers.where("salary LIKE ?", "%#{params[:salary]}%")
    elsif params[:type_of_contract]
      @offers = get_all_offers.where("type_of_contract LIKE ?", "%#{params[:type_of_contract]}%")
    end
  end

  def applicants
    @offer.applicants.map(&:customer)
  end

  def new_offer
    OfferForm.new
  end

  def get_all_offers
    Offer.all
  end

  def get_current_user_offers
    @current_user.offers if @current_user && @current_user.type == 'Company'
  end

  def update
    OfferForm.update_offer(@offer, @current_user)
  end

  def company_title
    @offer.company.title
  end

  def company_description
    @offer.company.description
  end

  def company_offers
    @offer.company.offers
  end

  def not_currently_opened(offer)
    @offer != offer
  end
end