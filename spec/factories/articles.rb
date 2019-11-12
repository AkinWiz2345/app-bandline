FactoryBot.define do
  factory :band_article, class: Article do
    association :user
    kind {'band'}
    heading {'hello'}
    introduction {'Nice to meet you'}
    gender {'指定なし'}
  end
  
  factory :member_article, class: Article do
    association :user
    kind {'band'}
    heading {'hello'}
    introduction {'Nice to meet you'}
    gender {user.gender}
  end
end
