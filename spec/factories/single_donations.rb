FactoryBot.define do
  factory :single_donation do
    amount {Faker::Number.number(digits: 3)}
    donor { FactoryBot.create(:donor)}
  end
end
