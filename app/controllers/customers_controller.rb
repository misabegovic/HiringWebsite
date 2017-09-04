class CustomersController < ApplicationController
  before_action :redirect_to_root
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      session[:user_id] = @customer.id
      redirect_to customers_candidates_path
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

  def redirect_to_root
    redirect_to root_path if logged_in?
  end
end