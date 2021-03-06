class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :introduction, presence: true, length: { maximum: 400 }
  
  has_secure_password
  
  mount_uploader :image, ImageUploader
  
  # お気に入り機能
  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :article, dependent: :destroy
  
  # 担当パート
  has_many :user_parts, dependent: :destroy
  has_many :parts, through: :user_parts, dependent: :destroy
  
  # メッセージ機能
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  def age
    d1 = self.birthday.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    return (d2 - d1) / 10000
  end
  
  def like(article)
    unless self.articles.include?(article)
     self.favorites.find_or_create_by(article_id: article.id)
    end
  end
  
  def remove_like(article)
    favorite = self.favorites.find_by(article_id: article.id)
    favorite.destroy if favorite
  end
  
  def like?(article)
    self.likes.include?(article)
  end
end
