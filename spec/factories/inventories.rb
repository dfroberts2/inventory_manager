FactoryGirl.define do
  factory :inventory do
    date Faker::Time.between(DateTime.now - 1, DateTime.now)
    association :business, factory: :business
  end
end