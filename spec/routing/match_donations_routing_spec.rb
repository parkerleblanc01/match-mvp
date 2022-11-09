require "rails_helper"

RSpec.describe MatchDonationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/match_donations").to route_to("match_donations#index")
    end

    it "routes to #new" do
      expect(get: "/match_donations/new").to route_to("match_donations#new")
    end

    it "routes to #show" do
      expect(get: "/match_donations/1").to route_to("match_donations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/match_donations/1/edit").to route_to("match_donations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/match_donations").to route_to("match_donations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/match_donations/1").to route_to("match_donations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/match_donations/1").to route_to("match_donations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/match_donations/1").to route_to("match_donations#destroy", id: "1")
    end
  end
end
