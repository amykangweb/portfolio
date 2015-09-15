class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user || NullUser.new
    @article = article
  end

  def create?
    user.editor? || user.author?
  end

  def update?
    article.author == user || user.editor?
  end

  def is_editor?
    user.editor?
  end
end
