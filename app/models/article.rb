class Article < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy

  def next
    Article.where(published: true).reverse.find do |article|
      article.id > self.id
    end
  end

  def previous
    Article.where(published: true).find do |article|
      article.id < self.id
    end
  end
end
