class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def new?
    @user.editor? || @user.author?
  end

  def create?
    @user.editor? || @user.author?
  end

  def update?
    @article.author == @user || @user.editor?
  end

  def publish?
    @user.editor?
  end

  def destroy?
    @user.editor?
  end
end
