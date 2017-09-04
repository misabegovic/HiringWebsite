class CompaniesController < ApplicationController
  before_action :redirect_to_root

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      session[:user_id] = @company.id
      redirect_to companies_candidates_path
    else
      flash.now[:alert] = @company.errors.full_messages
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

  def redirect_to_root
    redirect_to root_path if logged_in?
  end
end