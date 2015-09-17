class Comment < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  belongs_to :user
  belongs_to :article
  validates :body, presence: true, length: { maximum: 1000 }
end
