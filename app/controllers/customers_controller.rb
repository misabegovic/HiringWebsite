class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      session[:user_id] = @customer.id
      redirect_to root_path
    else
      flash.now[:alert] = @customer.errors.full_messages
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end