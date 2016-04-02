require 'rails_helper'

RSpec.describe "sketches/index", type: :view do
  before(:each) do
    assign(:sketches, [
      Sketch.create!(
        :image => "Image",
        :description => "MyText"
      ),
      Sketch.create!(
        :image => "Image",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of sketches" do
    render
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
