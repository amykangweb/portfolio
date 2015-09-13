class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def create?
    @user && (@user.editor? || @user.author?)
  end

  def update?
    @user && (@article.author == @user || @user.editor?)
  end

  def is_editor?
    @user && @user.editor?
  end
end
