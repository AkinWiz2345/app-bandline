class Part < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  has_many :user_parts, dependent: :destroy
  has_many :users, dependent: :destroy
end
