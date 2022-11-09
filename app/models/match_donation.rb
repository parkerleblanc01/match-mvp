class MatchDonation < ApplicationRecord
  belongs_to :donor

  validate :either_per_donor_or_per_donation

  def either_per_donor_or_per_donation
    if per_donor_amount && per_donation_amount
      errors.add(:per_donor_amount, "provide either per_donor_amount or per_donation_amount not both")
    end

    if !per_donor_amount && !per_donation_amount
      errors.add(:per_donor_amount, "per_donor_amount or per_donation_amount required")
    end
  end
end
