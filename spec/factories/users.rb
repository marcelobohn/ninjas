FactoryBot.define do
  factory :user do
    email { 'user@provider.com' }
    password { '123456' } 
    password_confirmation { '123456' }
    trait :customer do
      profile { :customer }
      name { 'customer sample' }
    end
    trait :ninja do
      profile { :ninja }
      name { 'ninja sample' }
    end
  end
end
