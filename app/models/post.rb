class Post < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  belongs_to :user

  def previous
    Post.all.detect { |post| post.id < self.id }
  end

  def next
    Post.all.detect { |post| post.id > self.id }
  end

end
