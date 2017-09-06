module Customers
  class ProfilesController < Customers::AuthorizationController
    before_action :set_profile, except: [:index]
    before_action :authorize_user, only: [:edit, :update]

    def index
      @profiles = Customer.all
    end

    def show; end

    def edit; end

    def update
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

    def set_profile
      @profile = Customer.find(params[:id])
    end

    def authorize_user
      render :index if @current_user != @profile
    end
  end
end