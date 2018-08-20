FactoryBot.define do

  factory :user do
    email {Faker::Internet.email}
    password 'example'
    password_confirmation 'example'
    name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
  end

end
