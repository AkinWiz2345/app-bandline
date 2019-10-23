class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :introduction, length: { maximum: 500 } 
  
  has_secure_password
  
  mount_uploader :image, ImageUploader
  
  has_many :articles, dependent: :destroy
  
  def age
    d1 = self.birthday.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    return (d2 - d1) / 10000
  end
end
