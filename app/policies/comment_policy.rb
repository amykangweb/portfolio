class CommentPolicy < ApplicationPolicy

  def is_commenter?
    record.user == user
  end

  def is_editor?
    user.editor?
  end
end
