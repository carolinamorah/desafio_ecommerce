require 'rails_helper'

RSpec.describe "coupons/new", type: :view do
  before(:each) do
    assign(:coupon, Coupon.new(
      kind: "MyString",
      code: "MyString",
      amount: 1,
      discount: "MyString",
      count: 1,
      user: nil
    ))
  end

  it "renders new coupon form" do
    render

    assert_select "form[action=?][method=?]", coupons_path, "post" do

      assert_select "input[name=?]", "coupon[kind]"

      assert_select "input[name=?]", "coupon[code]"

      assert_select "input[name=?]", "coupon[amount]"

      assert_select "input[name=?]", "coupon[discount]"

      assert_select "input[name=?]", "coupon[count]"

      assert_select "input[name=?]", "coupon[user_id]"
    end
  end
end
