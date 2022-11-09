require 'rails_helper'

RSpec.describe "single_donations/show", type: :view do
  before(:each) do
    assign(:single_donation, SingleDonation.create!(
      donor: nil,
      amount: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
  end
end
