require 'rails_helper'

RSpec.describe "colors/show", type: :view do
  before(:each) do
    @color = assign(:color, Color.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
