module Customers
  class ProfilesController < Customers::AuthorizationController
    before_action :set_fascade
    before_action :authorize_user, only: [:edit, :update]

    def index; end

    def show; end

    def edit
      @customer_form = CustomerForm.new
    end

    def update
      @customer_form = CustomerForm.new(profile_params)

      if @customer_form.update_this_customer(profile_params, @current_user)
        flash.now[:success] = 'You have successfully updated your account.'
      else
        flash.now[:alert] = @customer_form.errors
      end
      render :edit, id: @profiles_fascade.customer.id
    end

    private

    def profile_params
      params.require(:customer_form).permit(
        :email,
        :password,
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