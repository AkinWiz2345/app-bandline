FactoryBot.define do
  factory :user, aliases: [:owner] do
    name {'Tester'}
    sequence(:email) {|n| "tester#{n}@example.com"}
    password_digest {'dottle-nouveau-pavilion-tights-furze'}
    gender {'男性'}
    birthday {'2000-10-10'}
    introduction {'hello'}
  end
end
