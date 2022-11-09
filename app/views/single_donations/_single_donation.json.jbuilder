json.extract! single_donation, :id, :donor_id, :amount, :created_at, :updated_at
json.url single_donation_url(single_donation, format: :json)
