FactoryBot.define do
  factory :user do
    email 'example@example.com'
    password 'example'
    password_confirmation 'example'
    name 'nameUser'
    lastName 'lastNameUser'
  end
end