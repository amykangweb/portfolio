require 'rails_helper'

RSpec.describe "sketches/new", type: :view do
  before(:each) do
    assign(:sketch, Sketch.new(
      :image => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new sketch form" do
    render

    assert_select "form[action=?][method=?]", sketches_path, "post" do

      assert_select "input#sketch_image[name=?]", "sketch[image]"

      assert_select "textarea#sketch_description[name=?]", "sketch[description]"
    end
  end
end
