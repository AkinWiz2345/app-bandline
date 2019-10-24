class Article < ApplicationRecord
  belongs_to :user
  
  validates :heading, presence: true, length: { maximum: 255 }
  validates :introduction, presence: true, length: { maximum: 500 }
  validates :gender, presence: true
  
  mount_uploader :image, ImageUploader
  
  has_many :article_parts, dependent: :destroy
  has_many :parts, through: :article_parts, dependent: :destroy
end
