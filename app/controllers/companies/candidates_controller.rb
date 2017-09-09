module Companies
  class CandidatesController < Companies::AuthorizationController
    before_action :set_fascade

    def index
      @candidates_fascade.search(params[:search]) if params[:search]
    end

    def show; end

    private

    def set_fascade
      @candidates_fascade = CustomersFascade.new(params)
    end
  end
end