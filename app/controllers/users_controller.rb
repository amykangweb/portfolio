class UsersController < ApplicationController

  def control
    if user_signed_in? && current_user.author?
      @articles = current_user.articles
    else
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end
