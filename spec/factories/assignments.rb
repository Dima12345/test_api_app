FactoryBot.define do
  factory :assignment do
    month { Faker::Number.between(from: 0, to: 12) }
    rnd_percentage { Faker::Number.between(from: 0.0, to: 100.0) }
    total { Faker::Number.between(from: 0.0, to: 100.0) }
  end
end
