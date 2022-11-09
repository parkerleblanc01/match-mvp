class SingleDonation < ApplicationRecord
  belongs_to :donor

  has_many :generated_donations, dependent: :destroy

  def pay_corresponding_match_donations
    MatchDonation.pay_all_match_donations(self)
  end
end
