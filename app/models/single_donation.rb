class SingleDonation < ApplicationRecord
  belongs_to :donor

  has_many :generated_donations, dependent: :destroy

  after_create :pay_corresponding_match_donations

  private

  def pay_corresponding_match_donations
    MatchDonation.pay_all_match_donations(self)
  end
end
