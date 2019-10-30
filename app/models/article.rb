class Article < ApplicationRecord
  belongs_to :user
  
  validates :heading, presence: true, length: { maximum: 255 }
  validates :introduction, presence: true, length: { maximum: 400 }
  validates :gender, presence: true
  
  mount_uploader :image, ImageUploader
  
  # お気に入り機能
  has_many :favorites, dependent: :destroy
  
  # 募集パート
  has_many :article_parts, dependent: :destroy
  has_many :parts, through: :article_parts, dependent: :destroy
end
