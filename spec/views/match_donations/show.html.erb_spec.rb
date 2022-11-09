require 'rails_helper'

RSpec.describe "match_donations/show", type: :view do
  before(:each) do
    assign(:match_donation, MatchDonation.create!(
      donor: nil,
      max_amount: 2.5,
      active: false,
      per_donor_amount: 3.5,
      per_donation_amount: 4.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
  end
end
