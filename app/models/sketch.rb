class Sketch < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  mount_uploader :image, FeaturedUploader
  belongs_to :user

  def previous
    Sketch.all.detect { |sketch| sketch.id < self.id }
  end

  def next
    Sketch.all.detect { |sketch| sketch.id > self.id }
  end
end
