module Customers
  class CandidatesController < Customers::AuthorizationController
    def index
      @candidates = Company.all
      search
    end

    def show
      @candidate = Company.find(params[:id])
    end

    private

    def search
      if params[:title]
        @candidates = @candidates.select { |c| c.title.downcase.include? params[:title].downcase if c.title }
      elsif params[:contact_email]
        @candidates = @candidates.select { |c| c.contact_email.downcase.include? params[:contact_email].downcase if c.contact_email }
      end
    end
  end
end