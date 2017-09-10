module Companies
  class ProfilesController < Companies::AuthorizationController
    before_action :set_fascade
    before_action :authorize_user, only: [:edit, :update]

    def index; end

    def show; end

    def edit; end

    def update
      if @profiles_fascade.update(profile_params)
        flash.now[:success] = 'You have successfully updated your account.'
      else
        flash.now[:alert] = @profiles_fascade.errors
      end
      render :edit, id: @profiles_fascade.company.id
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