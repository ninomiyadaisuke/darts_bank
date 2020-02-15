class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/ }  
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  has_many :topics
  has_one :shop
  has_many :staffs
end
