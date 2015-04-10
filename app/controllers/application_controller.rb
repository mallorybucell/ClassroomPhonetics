class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:home]

  def home
  end

  rescue_from StandardError do |e|
      flash[:alert] = "Oops! Something went wrong. Please try again."
      redirect_to :back
  end

  rescue_from User::UnauthorizedError do |e|
    sign_out current_user
    flash[:alert] = "You are not authorized to view this page"
    redirect_to new_user_session_path
  end

end
