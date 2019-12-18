FactoryBot.define do
  factory :user do
    password { '123456' } 
    password_confirmation { '123456' }
    trait :customer do
      email { 'customer@provider.com' }
      profile { :customer }
      name { 'customer sample' }
    end
    trait :ninja do
      email { 'ninja@provider.com' }
      profile { :ninja }
      name { 'ninja sample' }
    end
  end
end
