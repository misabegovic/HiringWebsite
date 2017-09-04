module Companies
  class CandidatesController < Companies::AuthorizationController
    def index
      @candidates = Customer.all
    end

    def show
      @candidate = Customer.find(params[:id])
    end
  end
end