class MatchDonation < ApplicationRecord
  belongs_to :donor

  has_many :generated_donations

  scope :active, -> { where(active: true) }

  validate :either_per_donor_or_per_dollar

  def pay_match_donation(single_donation)
    if per_donor_amount
      match_per_donor(single_donation)
    else
      amt_to_pay = per_dollar_amount * single_donation.amount
      create_generated_donation(single_donation, amt_to_pay)
    end
  end

  def match_per_donor(single_donation)
    # Don't match my own contributions
    if single_donation.donor_id == donor_id
      return
    end

    # See if this donor has already be counted in this match
    unless generated_donations.where(donor_id: single_donation.donor_id).count > 0
      create_generated_donation(single_donation, per_donor_amount)
    end
  end

  def create_generated_donation(single_donation, amount)
    amt_remaining = donation_amount_remaining
    if amt_remaining > 0
      amt_to_be_paid = [amt_remaining, amount].min
      GeneratedDonation.create(
        single_donation: single_donation,
        donor: single_donation.donor,
        match_donation: self,
        amount: amt_to_be_paid,
      )

      if amt_to_be_paid == amt_remaining
        self.update(active: false)
      end
    else
      self.update(active: false)
    end
  end

  def donation_amount_remaining
    max_amount - generated_donations.sum(:amount)
  end

  def either_per_donor_or_per_dollar
    if per_donor_amount && per_dollar_amount
      errors.add(:per_donor_amount, "provide either per_donor_amount or per_dollar_amount not both")
    end

    if !per_donor_amount && !per_dollar_amount
      errors.add(:per_donor_amount, "per_donor_amount or per_dollar_amount required")
    end
  end

  def self.pay_all_match_donations(single_donation)
    MatchDonation.active.find_each do |d|
      d.pay_match_donation(single_donation)
    end
  end
end
