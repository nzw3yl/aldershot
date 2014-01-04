# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :priority do
    content "MyString"
    user_id 1
    high false
    complete false
  end
end
