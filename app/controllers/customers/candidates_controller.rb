module Customers
  class CandidatesController < Customers::AuthorizationController
    def index
      @candidates = Company.all
    end

    def show
      @candidate = Company.find(params[:id])
    end
  end
end