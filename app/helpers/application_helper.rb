module ApplicationHelper
  # translate Rails flash levels to appropriate Zurb foundation css classes
  def flash_class(level)
    level == :notice ? "info" : level.to_s
  end

  def user_can_view?(user)
    if user_signed_in?
      true if user.role == "author" || user.role == "editor"
    end
  end
end
