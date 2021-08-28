require 'rails_helper'

RSpec.describe "colors/new", type: :view do
  before(:each) do
    assign(:color, Color.new())
  end

  it "renders new color form" do
    render

    assert_select "form[action=?][method=?]", colors_path, "post" do
    end
  end
end
