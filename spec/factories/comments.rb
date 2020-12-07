FactoryBot.define do
  factory :comment do
    text           {'美味しそう'}
    association    :user
    association    :recipe
  end
end
