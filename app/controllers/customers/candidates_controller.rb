module Customers
  class CandidatesController < Customers::AuthorizationController
    before_action :set_fascade

    def index
      @candidates_fascade.search(params[:search]) if params[:search]
    end

    def show; end

    private

    def set_fascade
      @candidates_fascade = CompaniesFascade.new(params)
    end
  end
end