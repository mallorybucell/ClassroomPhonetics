class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:home]

  def home
    if current_user
      redirect_to dashboard_path
    else
      render :home
    end
  end
  
  private

  # rescue_from StandardError do |e|
  #     flash[:alert] = "Oops! Something went wrong. Please try again."
  #     redirect_to :back
  # end


  rescue_from User::UnauthorizedError do |e|
    sign_out current_user
    flash[:alert] = "You are not authorized to view this page"
    redirect_to new_user_session_path
  end

  def authenticate_teacher!
    raise User::UnauthorizedError unless current_user.teacher?
  end

  def authenticate_student!
    raise User::UnauthorizedError unless current_user.student?
  end

  def verify_admin!
    raise User::UnauthorizedError unless current_user.admin?
  end

  def get_exercise_from_session
    if session[:current_exercise_id]
      Exercise.find(session[:current_exercise_id].to_i)
    elsif params[:exercise_id]
      Exercise.find(params[:exercise_id].to_i)
    elsif params[:id] && params[:controller] == "exercises"
      Exercise.find(params[:id])
    else
      flash[:notice] = "Could not find exercise. Please try again later."
      redirect_to :back
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
