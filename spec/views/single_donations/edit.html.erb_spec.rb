require 'rails_helper'

RSpec.describe "single_donations/edit", type: :view do
  let(:single_donation) {
    SingleDonation.create!(
      donor: nil,
      amount: 1.5
    )
  }

  before(:each) do
    assign(:single_donation, single_donation)
  end

  it "renders the edit single_donation form" do
    render

    assert_select "form[action=?][method=?]", single_donation_path(single_donation), "post" do

      assert_select "input[name=?]", "single_donation[donor_id]"

      assert_select "input[name=?]", "single_donation[amount]"
    end
  end
end
