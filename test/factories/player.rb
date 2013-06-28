FactoryGirl.define do
  factory :player do
    user
    game
    score { rand(1..12) }

    factory :tj do
      score 4
    end

    factory :robin do
      score 5
    end

    factory :emily do
      score 6
    end

    factory :dan do
      score 12
    end
  end
end
