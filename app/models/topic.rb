class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true, length: {maximum: 120}
  validates :image, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
  default_scope -> { order(created_at: :desc) }
end
