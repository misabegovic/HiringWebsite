class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_current_user

  include Authorization

  private

  def get_current_user
    #session[:user_id] = nil
    @current_user = User.find(session[:user_id]) if session[:user_id].present?
  end
end
