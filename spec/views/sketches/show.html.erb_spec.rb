require 'rails_helper'

RSpec.describe "sketches/show", type: :view do
  before(:each) do
    @sketch = assign(:sketch, Sketch.create!(
      :image => "Image",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
  end
end
