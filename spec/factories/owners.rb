FactoryGirl.define do
  factory :owner do
    name {Faker::Name.name}
  end
end