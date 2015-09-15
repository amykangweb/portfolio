class Project < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  mount_uploader :thumbnail, ImageUploader
  mount_uploader :image, ImageUploader
  mount_uploader :extra, ImageUploader
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true
end
