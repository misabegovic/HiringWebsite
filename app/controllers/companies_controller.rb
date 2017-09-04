class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(account_params)

    if @company.save
      session[:user_id] = @company.id
      redirect_to root_path
    else
      flash.now[:alert] = @company.errors.full_messages
      render :new
    end
  end

  private

  def account_params
    params.require(:company).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end