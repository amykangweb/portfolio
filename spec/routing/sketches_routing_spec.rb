require "rails_helper"

RSpec.describe SketchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sketches").to route_to("sketches#index")
    end

    it "routes to #new" do
      expect(:get => "/sketches/new").to route_to("sketches#new")
    end

    it "routes to #show" do
      expect(:get => "/sketches/1").to route_to("sketches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sketches/1/edit").to route_to("sketches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sketches").to route_to("sketches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sketches/1").to route_to("sketches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sketches/1").to route_to("sketches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sketches/1").to route_to("sketches#destroy", :id => "1")
    end

  end
end
