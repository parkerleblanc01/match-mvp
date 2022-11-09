require 'rails_helper'

RSpec.describe SingleDonation, type: :model do
  feature "pay_corresponding_match_donations" do
    scenario "Generated donation exists so we need to calculate it" do
      md = FactoryBot.create(:match_donation, max_amount: 100, per_donor_amount: nil, per_dollar_amount: 5)
      md = FactoryBot.create(:match_donation, max_amount: 100, per_donor_amount: 5, per_dollar_amount: nil)
      sd = FactoryBot.create(:single_donation, amount: 5)

      sd.pay_corresponding_match_donations

      gd = GeneratedDonation.all

      expect(gd.first.amount).to eq(25)
      expect(gd.second.amount).to eq(5)
    end
  end 
end
