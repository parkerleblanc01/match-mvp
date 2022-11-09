require 'rails_helper'

RSpec.describe "match_donations/index", type: :view do
  before(:each) do
    assign(:match_donations, [
      MatchDonation.create!(
        donor: nil,
        max_amount: 2.5,
        active: false,
        per_donor_amount: 3.5,
        per_donation_amount: 4.5
      ),
      MatchDonation.create!(
        donor: nil,
        max_amount: 2.5,
        active: false,
        per_donor_amount: 3.5,
        per_donation_amount: 4.5
      )
    ])
  end

  it "renders a list of match_donations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.5.to_s), count: 2
  end
end
