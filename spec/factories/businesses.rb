FactoryGirl.define do
  factory :business do
    name {Faker::Company.name}
    association :owner, factory: :owner
  end
end