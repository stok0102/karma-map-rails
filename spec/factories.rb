FactoryGirl.define do
  factory :deed do
    content 'I am good'
    location 'Reykjavik'
  end

  factory :account do
    username 'John'
  end

  factory :comment do
    content 'This is great'
  end
end
