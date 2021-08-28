 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/sizes", type: :request do
  
  # Size. As you add validations to Size, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Size.create! valid_attributes
      get sizes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      size = Size.create! valid_attributes
      get size_url(size)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_size_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      size = Size.create! valid_attributes
      get edit_size_url(size)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Size" do
        expect {
          post sizes_url, params: { size: valid_attributes }
        }.to change(Size, :count).by(1)
      end

      it "redirects to the created size" do
        post sizes_url, params: { size: valid_attributes }
        expect(response).to redirect_to(size_url(Size.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Size" do
        expect {
          post sizes_url, params: { size: invalid_attributes }
        }.to change(Size, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post sizes_url, params: { size: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested size" do
        size = Size.create! valid_attributes
        patch size_url(size), params: { size: new_attributes }
        size.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the size" do
        size = Size.create! valid_attributes
        patch size_url(size), params: { size: new_attributes }
        size.reload
        expect(response).to redirect_to(size_url(size))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        size = Size.create! valid_attributes
        patch size_url(size), params: { size: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested size" do
      size = Size.create! valid_attributes
      expect {
        delete size_url(size)
      }.to change(Size, :count).by(-1)
    end

    it "redirects to the sizes list" do
      size = Size.create! valid_attributes
      delete size_url(size)
      expect(response).to redirect_to(sizes_url)
    end
  end
end
