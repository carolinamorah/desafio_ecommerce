require 'rails_helper'

RSpec.describe "sizes/show", type: :view do
  before(:each) do
    @size = assign(:size, Size.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
