class Donor < ApplicationRecord

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.create_or_update(first_name:, last_name:, email:)
    donor = Donor.find_by_email(email)
    if donor
      donor.update(first_name: first_name, last_name: last_name)
      donor
    else
      Donor.create(first_name: first_name, last_name: last_name, email: email)
    end
  end
end
