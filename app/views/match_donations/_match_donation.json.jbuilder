json.extract! match_donation, :id, :donor_id, :max_amount, :active, :per_donor_amount, :per_donation_amount, :created_at, :updated_at
json.url match_donation_url(match_donation, format: :json)
