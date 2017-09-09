module Customers
  class ProfilesController < Customers::AuthorizationController
    before_action :set_fascade
    before_action :authorize_user, only: [:edit, :update]

    def index; end

    def show; end

    def edit; end

    def update
      @profile = @profiles_fascade.customer

      if @profile.update(profile_params)
        flash.now[:success] = 'You have successfully updated your account.'
      else
        flash.now[:alert] = @profile.errors.full_messages
      end
      render :edit, id: @profile.id
    end

    private

    def profile_params
      params.require(:customer).permit(
        :email,
        :password,
        :password_confirmation,
        :motivation_letter,
        :experience,
        :skills,
        :full_name
      )
    end

    def set_fascade
      @profiles_fascade = CustomersFascade.new(params)
    end

    def authorize_user
      render :index if @current_user != @profiles_fascade.customer
    end
  end
end