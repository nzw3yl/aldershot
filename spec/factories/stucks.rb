# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stuck do
    content "MyString"
    user_id 1
    owner_id 1
    complete false
  end
end
