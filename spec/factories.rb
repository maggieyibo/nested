FactoryGirl.define do  factory :message do
    
  end


  factory :user do |f|
    f.firstname "Joseph"
    f.lastname "Go Chua"
    f.email "gogojojo@gmail.com"
    f.phonenumber "3103570264"
    f.bio "he is a cool guy"
    f.age "26"
    f.personality "ENFJ"
    f.password "pace"
    f.password_confirmation "pace"
  end
end
