class ArticlePart < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :part, optional: true
end
