FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "secret"
    password_confirmation "secret"
    admin false
  end
end
