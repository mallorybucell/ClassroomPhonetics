class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
  end
  
  #TODO Rescue from Std Error
  #TODO Rescue from User::UnauthorizedError
end
