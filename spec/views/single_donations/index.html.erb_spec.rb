require 'rails_helper'

RSpec.describe "single_donations/index", type: :view do
  before(:each) do
    assign(:single_donations, [
      SingleDonation.create!(
        donor: nil,
        amount: 2.5
      ),
      SingleDonation.create!(
        donor: nil,
        amount: 2.5
      )
    ])
  end

  it "renders a list of single_donations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
  end
end
