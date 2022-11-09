require "rails_helper"

RSpec.describe SingleDonationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/single_donations").to route_to("single_donations#index")
    end

    it "routes to #new" do
      expect(get: "/single_donations/new").to route_to("single_donations#new")
    end

    it "routes to #show" do
      expect(get: "/single_donations/1").to route_to("single_donations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/single_donations/1/edit").to route_to("single_donations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/single_donations").to route_to("single_donations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/single_donations/1").to route_to("single_donations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/single_donations/1").to route_to("single_donations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/single_donations/1").to route_to("single_donations#destroy", id: "1")
    end
  end
end
