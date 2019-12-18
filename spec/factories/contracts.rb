FactoryBot.define do
  factory :contract do
    customer { nil }
    ninja { nil }
    description { "MyString" }
    service_type { 1 }
    data_accept { "2019-12-18 14:11:37" }
    date_finish { "2019-12-18 14:11:37" }
  end
end
