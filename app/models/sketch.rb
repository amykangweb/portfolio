class Sketch < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  mount_uploader :image, FeaturedUploader
  belongs_to :user
end
