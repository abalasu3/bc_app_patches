require "spec_helper"

describe VoterepliesController do
  describe "routing" do

    it "routes to #index" do
      get("/votereplies").should route_to("votereplies#index")
    end

    it "routes to #new" do
      get("/votereplies/new").should route_to("votereplies#new")
    end

    it "routes to #show" do
      get("/votereplies/1").should route_to("votereplies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/votereplies/1/edit").should route_to("votereplies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/votereplies").should route_to("votereplies#create")
    end

    it "routes to #update" do
      put("/votereplies/1").should route_to("votereplies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/votereplies/1").should route_to("votereplies#destroy", :id => "1")
    end

  end
end
