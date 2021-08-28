require 'rails_helper'

RSpec.describe "variants/index", type: :view do
  before(:each) do
    assign(:variants, [
      Variant.create!(),
      Variant.create!()
    ])
  end

  it "renders a list of variants" do
    render
  end
end
