class Article < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy

  def previous
    Article.all.detect { |article| article.id < self.id }
  end

  def next
    Article.all.reverse.detect { |article| article.id > self.id }
  end

end
