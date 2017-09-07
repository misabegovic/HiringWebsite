module Companies
  class CandidatesController < Companies::AuthorizationController
    def index
      @candidates = Customer.all
      search
    end

    def show
      @candidate = Customer.find(params[:id])
    end

    private

    def search
      if params[:skills]
        params[:skills].split(',').map do |skill|
          @candidates = @candidates.select { |c| c.skills.downcase.include? skill.downcase if c.skills }
        end
      elsif params[:name]
        @candidates = @candidates.select { |c| c.full_name.downcase.include? params[:name].downcase if c.full_name }
      elsif params[:email]
        @candidates = @candidates.select { |c| c.email.downcase.include? params[:email].downcase if c.email }
      end
    end
  end
end