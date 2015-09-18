class ArticlePolicy < ApplicationPolicy

  def create?
    user.editor? || user.author?
  end

  def update?
    record.author == user || user.editor?
  end

  def is_editor?
    user.editor?
  end
end
