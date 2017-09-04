module Companies
  class ProfilesController < Companies::AuthorizationController
    before_action :set_profile, except: [:index]
    before_action :authorize_user, only: [:edit, :update]

    def index
      @companies = Company.all
    end

    def show; end

    def edit; end

    def update; end

    private

    def set_profile
      @profile = Company.find(params[:id])
    end

    def authorize_user
      render :index if @current_user != @profile
    end
  end
end