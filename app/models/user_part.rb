class UserPart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :part, optional: true
end
