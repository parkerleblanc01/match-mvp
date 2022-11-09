require 'rails_helper'

RSpec.describe Donor, type: :model do
  feature "create_or_update" do
    scenario "Successfully creates donor if it doesn't exist" do
      donor = Donor.create_or_update(first_name: "test", last_name: "user", email: "test@test.com")

      expect(donor.first_name).to eq("test")
    end

    scenario "Successfully updates donor if it already exists" do
      donor1 = Donor.create_or_update(first_name: "test1", last_name: "user", email: "test@test.com")

      donor2 = Donor.create_or_update(first_name: "test2", last_name: "user", email: "test@test.com")

      expect(donor1.first_name).to eq("test1")
      expect(donor2.first_name).to eq("test2")
      expect(donor1.id).to eq(donor2.id)
    end
  end
end
