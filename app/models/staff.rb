class Staff < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :staff_name, presence: true, length: {maximum: 15}
  validates :nickname, presence: true, length: {maximum: 15}
  validates :rating, presence: true
  validates :introduction, presence: true, length: {maximum: 120}
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader
  default_scope -> { order(created_at: :desc) }
end
