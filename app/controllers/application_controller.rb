class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # http://stackoverflow.com/questions/26472039/scaffolded-tests-failing-with-actioncontrollerinvalidauthenticitytoken
  if Rails.env.test?
    protect_from_forgery with: :null_session
  else
    protect_from_forgery with: :exception
  end
end
