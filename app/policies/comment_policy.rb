class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :comment

  def initialize(user, comment)
    @user = user || NullUser.new
    @comment = comment
  end

  def is_commenter?
    comment.user == user
  end

  def is_editor?
    user.editor?
  end
end
