require 'rails_helper'

RSpec.describe "sketches/edit", type: :view do
  before(:each) do
    @sketch = assign(:sketch, Sketch.create!(
      :image => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit sketch form" do
    render

    assert_select "form[action=?][method=?]", sketch_path(@sketch), "post" do

      assert_select "input#sketch_image[name=?]", "sketch[image]"

      assert_select "textarea#sketch_description[name=?]", "sketch[description]"
    end
  end
end
