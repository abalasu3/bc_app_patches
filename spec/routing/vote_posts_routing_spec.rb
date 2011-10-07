require "spec_helper"

describe VotePostsController do
  describe "routing" do

    it "routes to #index" do
      get("/vote_posts").should route_to("vote_posts#index")
    end

    it "routes to #new" do
      get("/vote_posts/new").should route_to("vote_posts#new")
    end

    it "routes to #show" do
      get("/vote_posts/1").should route_to("vote_posts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vote_posts/1/edit").should route_to("vote_posts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vote_posts").should route_to("vote_posts#create")
    end

    it "routes to #update" do
      put("/vote_posts/1").should route_to("vote_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vote_posts/1").should route_to("vote_posts#destroy", :id => "1")
    end

  end
end
