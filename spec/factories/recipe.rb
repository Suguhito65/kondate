FactoryBot.define do
  factory :recipe do
    cuisine              {'餃子'}
    description          {'小麦粉を原料とした皮で肉や野菜などで作った餡を包み焼く'}
    foodstuff            {'ひき肉、ニラ、キャベツ'}
    association    :user
  end
end