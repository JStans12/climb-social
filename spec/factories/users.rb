FactoryGirl.define do
  factory :user do

    sequence :email do |n|
      "user#{n}@example.com"
    end

    password "password"
    password_confirmation "password"
    auth_token "token"
  end
end
