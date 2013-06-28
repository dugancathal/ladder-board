FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@tendrilinc.com" }
    password 'password'
  end
end
