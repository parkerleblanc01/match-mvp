class GeneratedDonation < ApplicationRecord
  belongs_to :match_donation
  belongs_to :single_donation
  belongs_to :donor
end
