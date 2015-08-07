class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def authenticate_admin_user!
    authenticate_user! 
    unless current_user.is_admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path 
    end
  end
end
