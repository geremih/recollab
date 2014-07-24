FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "john#{n}@doe.com" }
    password "password"
    password_confirmation "password"
  end
end
