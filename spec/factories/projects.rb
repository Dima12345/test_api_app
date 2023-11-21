FactoryBot.define do
  factory :project do
    name { Faker::Name.unique }
  end
end
