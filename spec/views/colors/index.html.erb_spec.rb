require 'rails_helper'

RSpec.describe "colors/index", type: :view do
  before(:each) do
    assign(:colors, [
      Color.create!(),
      Color.create!()
    ])
  end

  it "renders a list of colors" do
    render
  end
end
