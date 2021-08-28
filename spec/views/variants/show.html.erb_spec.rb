require 'rails_helper'

RSpec.describe "variants/show", type: :view do
  before(:each) do
    @variant = assign(:variant, Variant.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
