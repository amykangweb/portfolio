require 'rails_helper'

RSpec.describe "Sketches", type: :request do
  describe "GET /sketches" do
    it "works! (now write some real specs)" do
      get sketches_path
      expect(response).to have_http_status(200)
    end
  end
end
