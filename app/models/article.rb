class Article < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  mount_uploader :featured, FeaturedUploader
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy
  validate :featured_size

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

  private

  def featured_size
    if featured.size > 5.megabytes
      errors.add(:featured, "should be less than 5MB")
    end
  end
end
