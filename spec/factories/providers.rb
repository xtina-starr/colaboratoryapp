# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider do
    uid 1
    provider_name "MyString"
    token "MyString"
    secret "MyString"
    avatar "MyString"
    username "MyString"
    user_id 1
    email "MyString"
  end
end
