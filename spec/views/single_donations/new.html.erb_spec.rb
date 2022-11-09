require 'rails_helper'

RSpec.describe "single_donations/new", type: :view do
  before(:each) do
    assign(:single_donation, SingleDonation.new(
      donor: nil,
      amount: 1.5
    ))
  end

  it "renders new single_donation form" do
    render

    assert_select "form[action=?][method=?]", single_donations_path, "post" do

      assert_select "input[name=?]", "single_donation[donor_id]"

      assert_select "input[name=?]", "single_donation[amount]"
    end
  end
end
