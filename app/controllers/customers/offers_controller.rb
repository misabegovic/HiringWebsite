module Customers
  class OffersController < Customers::AuthorizationController
    before_action :set_offer, except: [:index]
    before_action :redirect_if_customer_properties_empty, only: [:update]

    def index
      @offers = Offer.all
      search
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

    def search
      if params[:position]
        @offers = @offers.select { |c| c.position.downcase.include? params[:position].downcase }
      elsif params[:salary]
        @offers = @offers.select { |c| c.salary.downcase.include? params[:salary].downcase  }
      elsif params[:type_of_contract]
        @offers = @offers.select { |c| c.type_of_contract.downcase.include? params[:type_of_contract].downcase  }
      end
    end
  end
end