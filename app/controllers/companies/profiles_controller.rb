module Companies
  class ProfilesController < Companies::AuthorizationController
    before_action :set_profile

    def show; end

    def edit; end

    def update; end

    private

    def set_profile
      @profile = Company.find(params[:id])
    end
  end
end