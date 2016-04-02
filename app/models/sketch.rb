class Sketch < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  mount_uploader :featured, FeaturedUploader
  belongs_to :user
end
