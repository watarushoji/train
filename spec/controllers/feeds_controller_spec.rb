require 'rails_helper'

RSpec.describe FeedsController, :type => :controller do

  describe "GET article" do
    it "returns http success" do
      get :article
      expect(response).to have_http_status(:success)
    end
  end

end
