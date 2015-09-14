class Project < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :image, ImageUploader
  mount_uploader :extra, ExtraUploader
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true
end
