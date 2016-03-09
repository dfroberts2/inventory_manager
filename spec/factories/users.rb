FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    password "testing"
  end
end