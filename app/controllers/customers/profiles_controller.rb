module Customers
  class ProfilesController < Customers::AuthorizationController
    before_action :set_fascade
    before_action :authorize_user, only: [:edit, :update]

    def index; end

    def show; end

    def edit; end

    def update
      if @profiles_fascade.update(profile_params)
        flash.now[:success] = 'You have successfully updated your account.'
      else
        flash.now[:alert] = @profiles_fascade.errors.
      end
      render :edit, id: @profiles_fascade.customer.id
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