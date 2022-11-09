require 'rails_helper'

RSpec.describe MatchDonation, type: :model do
  feature "validation" do
    scenario "Successfully validates match donation" do
      donor = FactoryBot.create(:donor)
      md = MatchDonation.new(max_amount: 500, per_dollar_amount: 2, donor: donor)

      expect(md.valid?).to eq(true)
    end

    scenario "Successfully validates match donation and finds both per_dollar and per_donor amounts" do
      donor = FactoryBot.create(:donor)
      md = MatchDonation.new(max_amount: 500, per_dollar_amount: 2, per_donor_amount: 4, donor: donor)

      expect(md.valid?).to eq(false)
    end
  end

  feature "donation_amount_remaining" do
    scenario "No generated donations so amount matches max" do
      md = FactoryBot.create(:match_donation)

      expect(md.donation_amount_remaining).to eq(md.max_amount)
    end

    scenario "Generated donation exists so we need to calculate it" do
      md = FactoryBot.create(:match_donation)
      sd = FactoryBot.create(:single_donation)
      gd = GeneratedDonation.create(
        single_donation: sd,
        match_donation: md,
        donor: sd.donor,
        amount: 5
      )

      expect(md.donation_amount_remaining).to eq(md.max_amount - 5)
    end
  end

  feature "pay_match_donation" do
    scenario "Successfully pays matched donation per donor" do
      md = FactoryBot.create(:match_donation, max_amount: 100, per_donor_amount: 5, per_dollar_amount: nil)
      sd = FactoryBot.create(:single_donation, amount: 5)

      md.pay_match_donation(sd)

      expect(md.generated_donations.count).to eq(1)

      gd = md.generated_donations.first

      expect(gd.amount).to eq(5)
    end

    scenario "Successfully pays matched donation per dollar" do
      md = FactoryBot.create(:match_donation, max_amount: 100, per_donor_amount: nil, per_dollar_amount: 5)
      sd = FactoryBot.create(:single_donation, amount: 5)

      md.pay_match_donation(sd)

      expect(md.generated_donations.count).to eq(1)

      gd = md.generated_donations.first

      expect(gd.amount).to eq(25)
    end
  end
end
