# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content do
    user_id 1
    type ""
    collab false
    feedback false
    latest false
    media_id 1
    title "MyString"
    media_type "MyString"
  end
end
