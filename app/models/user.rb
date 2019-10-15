class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :gender, presence: true
  # validates :birth, presence: true
  validates :introduction, length: { maximum: 500 } 
  has_secure_password
  
  enum gender: {男性: 1, 女性: 2}
  
  mount_uploader :image, ImageUploader
end
