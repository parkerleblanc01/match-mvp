require 'rails_helper'

RSpec.describe "match_donations/new", type: :view do
  before(:each) do
    assign(:match_donation, MatchDonation.new(
      donor: nil,
      max_amount: 1.5,
      active: false,
      per_donor_amount: 1.5,
      per_donation_amount: 1.5
    ))
  end

  it "renders new match_donation form" do
    render

    assert_select "form[action=?][method=?]", match_donations_path, "post" do

      assert_select "input[name=?]", "match_donation[donor_id]"

      assert_select "input[name=?]", "match_donation[max_amount]"

      assert_select "input[name=?]", "match_donation[active]"

      assert_select "input[name=?]", "match_donation[per_donor_amount]"

      assert_select "input[name=?]", "match_donation[per_donation_amount]"
    end
  end
end
