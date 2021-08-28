require 'rails_helper'

RSpec.describe "sizes/index", type: :view do
  before(:each) do
    assign(:sizes, [
      Size.create!(),
      Size.create!()
    ])
  end

  it "renders a list of sizes" do
    render
  end
end
