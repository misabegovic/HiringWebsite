module Companies
  class ProfilesController < Companies::AuthorizationController
    before_action :set_fascade
    before_action :authorize_user, only: [:edit, :update]

    def index; end

    def show; end

    def edit; end

    def update
      @profile = @profiles_fascade.company

      if @profile.update(profile_params)
        flash.now[:success] = 'You have successfully updated your account.'
      else
        flash.now[:alert] = @profile.errors.full_messages
      end
      render :edit, id: @profile.id
    end

    private

    def profile_params
      params.require(:company).permit(
        :email,
        :password,
        :password_confirmation,
        :description,
        :contact_email,
        :employees,
        :title
      )
    end

    def set_fascade
      @profiles_fascade = CompaniesFascade.new(params)
    end

    def authorize_user
      render :index if @current_user != @profiles_fascade.company
    end
  end
end