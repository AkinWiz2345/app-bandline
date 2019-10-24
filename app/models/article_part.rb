class ArticlePart < ApplicationRecord
  belongs_to :article
  belongs_to :part
end
