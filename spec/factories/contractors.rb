FactoryBot.define do
  factory :contractor do
    name { Faker::Name.unique }
    salary { Faker::Number.between(from: 0.0, to: 10000.0) }
    total { Faker::Number.between(from: 0.0, to: 10000.0) } 
  end
end
