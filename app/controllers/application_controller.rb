class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # http://stackoverflow.com/questions/26472039/scaffolded-tests-failing-with-actioncontrollerinvalidauthenticitytoken
  if Rails.env.test?
    protect_from_forgery with: :null_session
  else
    protect_from_forgery with: :exception
  end

  private

  def after_sign_in_path_for(resource)
    articles_path
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
