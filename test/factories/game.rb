FactoryGirl.define do
  factory :game do
    date { Date.today }
    sequence(:number) {|n| n }
  end
end
