FactoryBot.define do
  factory :match_donation do
    max_amount {Faker::Number.number(digits: 3)}
    per_dollar_amount {Faker::Number.number(digits: 1)}
    donor { FactoryBot.create(:donor)}
  end
end
