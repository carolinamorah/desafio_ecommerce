require 'rails_helper'

RSpec.describe "coupons/show", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      kind: "Kind",
      code: "Code",
      amount: 2,
      discount: "Discount",
      count: 3,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Kind/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Discount/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
