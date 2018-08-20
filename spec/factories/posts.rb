FactoryBot.define do

  factory :post do |f|
    f.title {Faker::Name.name}
    f.priority {Faker::Number.between(1, 5)}
    f.user
  end

  factory :invalid_post, parent: :post do |f|
    f.title nil
  end

end
