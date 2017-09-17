class CustomersController < ApplicationController
  before_action :redirect_to_root
  
  def new
    @customer_form = CustomerForm.new
  end

  def create
    @customer_form = CustomerForm.new(customer_params)
    customer = @customer_form.create_new_customer

    if customer
      session[:user_id] = customer.id
      redirect_to customers_candidates_path
    else
      flash.now[:alert] = @customer_form.errors.full_messages
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer_form).permit(
      :email,
      :password
    )
  end

  def redirect_to_root
    redirect_to root_path if logged_in?
  end
end