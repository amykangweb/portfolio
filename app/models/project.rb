class Project < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  mount_uploader :thumbnail, ImageUploader
  mount_uploader :image, ImageUploader
  mount_uploader :extra, ImageUploader
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true
  validates :description, presence: true

  def next
    Project.all.reverse.find do |project|
      project.id > self.id
    end
  end

  def previous
    Project.all.find do |project|
      project.id < self.id
    end
  end
end
